; ModuleID = 'main.cpp'
source_filename = "main.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

@.str = private unnamed_addr constant [18 x i8] c"src(%d, %d) = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"tgt(%d, %d) = %d\0A\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"similarity count : %d\0Adifference count : %d\0A\00", align 1
; Function Attrs: noinline nounwind optnone ssp uwtable
define i1 @_Z3srccc(i8 signext %x, i8 signext %y) {
  %tmp0 = lshr i8 255, %y
  %tmp1 = and i8 %tmp0, %x
  %ret = icmp sge i8 %tmp1, %x
  ret i1 %ret
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i1 @_Z3tgtcc(i8 signext %x, i8 signext %y) {
  %tmp0 = lshr i8 255, %y
  %1 = icmp sge i8 %tmp0, %x
  ret i1 %1
}
; Function Attrs: noinline norecurse optnone ssp uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i8 0, i8* %4, align 1
  br label %6

6:                                                ; preds = %54, %0
  %7 = load i8, i8* %4, align 1
  %8 = zext i8 %7 to i32
  %9 = icmp slt i32 %8, 255
  br i1 %9, label %10, label %57

10:                                               ; preds = %6
  store i8 0, i8* %5, align 1
  br label %11

11:                                               ; preds = %50, %10
  %12 = load i8, i8* %5, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp slt i32 %13, 255
  br i1 %14, label %15, label %53

15:                                               ; preds = %11
  %16 = load i8, i8* %4, align 1
  %17 = load i8, i8* %5, align 1
  %18 = call i1 @_Z3srccc(i8 signext %16, i8 signext %17)
  %19 = zext i1 %18 to i32
  %20 = load i8, i8* %4, align 1
  %21 = load i8, i8* %5, align 1
  %22 = call i1 @_Z3tgtcc(i8 signext %20, i8 signext %21)
  %23 = zext i1 %22 to i32
  %24 = icmp eq i32 %19, %23
  br i1 %24, label %25, label %28

25:                                               ; preds = %15
  %26 = load i32, i32* %2, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %2, align 4
  br label %49

28:                                               ; preds = %15
  %29 = load i32, i32* %3, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %3, align 4
  %31 = load i8, i8* %4, align 1
  %32 = zext i8 %31 to i32
  %33 = load i8, i8* %5, align 1
  %34 = zext i8 %33 to i32
  %35 = load i8, i8* %4, align 1
  %36 = load i8, i8* %5, align 1
  %37 = call i1 @_Z3srccc(i8 signext %35, i8 signext %36)
  %38 = zext i1 %37 to i32
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i32 %32, i32 %34, i32 %38)
  %40 = load i8, i8* %4, align 1
  %41 = zext i8 %40 to i32
  %42 = load i8, i8* %5, align 1
  %43 = zext i8 %42 to i32
  %44 = load i8, i8* %4, align 1
  %45 = load i8, i8* %5, align 1
  %46 = call i1 @_Z3tgtcc(i8 signext %44, i8 signext %45)
  %47 = zext i1 %46 to i32
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i32 %41, i32 %43, i32 %47)
  br label %49

49:                                               ; preds = %28, %25
  br label %50

50:                                               ; preds = %49
  %51 = load i8, i8* %5, align 1
  %52 = add i8 %51, 1
  store i8 %52, i8* %5, align 1
  br label %11

53:                                               ; preds = %11
  br label %54

54:                                               ; preds = %53
  %55 = load i8, i8* %4, align 1
  %56 = add i8 %55, 1
  store i8 %56, i8* %4, align 1
  br label %6

57:                                               ; preds = %6
  %58 = load i32, i32* %2, align 4
  %59 = load i32, i32* %3, align 4
  %60 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i64 0, i64 0), i32 %58, i32 %59)
  %61 = load i32, i32* %1, align 4
  ret i32 %61
}
declare i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "darwin-stkchk-strong-link" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "darwin-stkchk-strong-link" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "darwin-stkchk-strong-link" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Apple clang version 12.0.0 (clang-1200.0.32.29)"}
