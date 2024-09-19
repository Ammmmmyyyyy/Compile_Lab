@.str = private unnamed_addr constant [25 x i8] c"请输入一个数字：\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; int sum_array(int *arr, int n)
define i32 @sum_array(i32* %arr, i32 %n) {
entry:
  %sum = alloca i32, align 4                 ; 分配 sum 变量
  %i = alloca i32, align 4                   ; 分配 i 变量
  store i32 0, i32* %sum, align 4            ; 初始化 sum = 0
  store i32 0, i32* %i, align 4              ; 初始化 i = 0
  br label %loop_start                       ; 进入循环

loop_start:                                  ; 循环起始点
  %i_val = load i32, i32* %i, align 4        ; 加载 i 的当前值
  %cmp = icmp slt i32 %i_val, %n             ; i < n
  br i1 %cmp, label %loop_body, label %loop_end ; 判断是否进入循环

loop_body:                                   ; 循环体
  %i_val2 = load i32, i32* %i, align 4       ; 再次加载 i 的值
  %idx = getelementptr inbounds i32, i32* %arr, i32 %i_val2 ; 计算数组索引
  %arr_val = load i32, i32* %idx, align 4    ; 加载数组元素值
  %sum_val = load i32, i32* %sum, align 4    ; 加载当前的 sum 值
  %new_sum = add i32 %sum_val, %arr_val      ; sum += arr[i]
  store i32 %new_sum, i32* %sum, align 4     ; 更新 sum
  %i_next = add i32 %i_val2, 1               ; i++
  store i32 %i_next, i32* %i, align 4        ; 更新 i
  br label %loop_start                       ; 继续循环

loop_end:                                    ; 循环结束
  %result = load i32, i32* %sum, align 4     ; 返回 sum 值
  ret i32 %result
}

; int main()
define i32 @main() {
entry:
  %a = alloca i32*, align 8                  ; 分配指针 a
  %n = alloca i32, align 4                   ; 分配 n
  %sum = alloca i32, align 4                 ; 分配 sum
  %i = alloca i32, align 4                   ; 分配 i
  %ptr = alloca i32*, align 8                ; 分配 ptr

  ; 调用 printf 输出提示信息
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i32 0, i32 0))
  
  ; 读取用户输入的 n
  %call1 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str1, i32 0, i32 0), i32* %n)

  ; 获取 n 的值
  %n_val = load i32, i32* %n, align 4

  ; 动态分配数组内存
  %size = mul i32 %n_val, 4                  ; n * sizeof(int)
  %ptr_to_mem = call i8* @malloc(i32 %size)
  %array_ptr = bitcast i8* %ptr_to_mem to i32* ; 将 malloc 返回的 i8* 转换为 i32*
  store i32* %array_ptr, i32** %a, align 8   ; 存储指针到 a

  ; 循环初始化数组
  store i32 0, i32* %i, align 4              ; 初始化 i = 0
  br label %loop_cond

loop_cond:
  %i_val = load i32, i32* %i, align 4        ; 加载 i
  %cmp = icmp slt i32 %i_val, %n_val         ; i < n
  br i1 %cmp, label %loop_body, label %loop_end

loop_body:
  %i_val2 = load i32, i32* %i, align 4       ; 加载 i
  %arr_ptr = load i32*, i32** %a, align 8    ; 加载数组指针
  %idx = getelementptr inbounds i32, i32* %arr_ptr, i32 %i_val2 ; arr[i]
  store i32 %i_val2, i32* %idx, align 4      ; arr[i] = i
  %i_next = add i32 %i_val2, 1               ; i++
  store i32 %i_next, i32* %i, align 4        ; 存储更新的 i
  br label %loop_cond

loop_end:
  ; 调用 sum_array 函数
  %arr_ptr2 = load i32*, i32** %a, align 8   ; 加载数组指针
  %n_val2 = load i32, i32* %n, align 4       ; 加载 n
  %call2 = call i32 @sum_array(i32* %arr_ptr2, i32 %n_val2) ; 调用 sum_array(arr, n)
  store i32 %call2, i32* %sum, align 4       ; 存储 sum 的返回值

  ; 打印 sum 结果
  %sum_val = load i32, i32* %sum, align 4
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str2, i32 0, i32 0), i32 %sum_val)

  ; 释放动态分配的内存
  %arr_ptr3 = load i32*, i32** %a, align 8
  %cast_ptr = bitcast i32* %arr_ptr3 to i8*
  call void @free(i8* %cast_ptr)

  ret i32 0
}

; 外部函数声明
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
declare i8* @malloc(i32)
declare void @free(i8*)
