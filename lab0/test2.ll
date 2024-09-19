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
  %n = alloca i32, align 4                   ; 分配 n
  %sum = alloca i32, align 4                 ; 分配 sum
  %i = alloca i32, align 4                   ; 分配 i
  %arr = alloca [100 x i32], align 16        ; 分配静态数组 arr，大小为 100

  ; 假设 n = 10
  store i32 10, i32* %n, align 4             ; 假设 n = 10
  %n_val = load i32, i32* %n, align 4

  ; 循环初始化数组 arr[i] = i
  store i32 0, i32* %i, align 4              ; 初始化 i = 0
  br label %loop_cond

loop_cond:
  %i_val = load i32, i32* %i, align 4        ; 加载 i
  %cmp = icmp slt i32 %i_val, %n_val         ; i < n
  br i1 %cmp, label %loop_body, label %loop_end

loop_body:
  %i_val2 = load i32, i32* %i, align 4       ; 加载 i
  %idx = getelementptr inbounds [100 x i32], [100 x i32]* %arr, i32 0, i32 %i_val2 ; arr[i]
  store i32 %i_val2, i32* %idx, align 4      ; arr[i] = i
  %i_next = add i32 %i_val2, 1               ; i++
  store i32 %i_next, i32* %i, align 4        ; 存储更新的 i
  br label %loop_cond

loop_end:
  ; 调用 sum_array 函数
  %arr_ptr = getelementptr inbounds [100 x i32], [100 x i32]* %arr, i32 0, i32 0
  %n_val2 = load i32, i32* %n, align 4
  %call = call i32 @sum_array(i32* %arr_ptr, i32 %n_val2) ; 调用 sum_array(arr, n)
  store i32 %call, i32* %sum, align 4       ; 存储 sum 的返回值

  %sum_val = load i32, i32* %sum, align 4
  ret i32 %sum_val                          ; 返回 sum 值，结束程序
}
