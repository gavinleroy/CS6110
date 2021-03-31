; ModuleID = 'main.cpp'
source_filename = "main.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

@.str = private unnamed_addr constant [18 x i8] c"src(%d, %d) = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"tgt(%d, %d) = %d\0A\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"similarity count : %d\0Adifference count : %d\0A\00", align 1
; Function Attrs: noinline nounwind optnone ssp uwtable
define i1 @_Z3srccc(i8 %x, i8 %y) {
  %tmp0 = lshr i8 255, %y
  %tmp1 = and i8 %tmp0, %x
  %ret = icmp sge i8 %tmp1, %x
  ret i1 %ret
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i1 @_Z3tgtcc(i8 %x, i8 %y) {
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
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i8 0, i8* %4, align 1
  br label %8

8:                                                ; preds = %56, %0
  %9 = load i8, i8* %4, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp slt i32 %10, 255
  br i1 %11, label %12, label %59

12:                                               ; preds = %8
  store i8 0, i8* %5, align 1
  br label %13

13:                                               ; preds = %52, %12
  %14 = load i8, i8* %5, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp slt i32 %15, 255
  br i1 %16, label %17, label %55

17:                                               ; preds = %13
  %18 = load i8, i8* %4, align 1
  %19 = load i8, i8* %5, align 1
  %20 = call zeroext i1 @_Z3srccc(i8 signext %18, i8 signext %19)
  %21 = zext i1 %20 to i32
  %22 = load i8, i8* %4, align 1
  %23 = load i8, i8* %5, align 1
  %24 = call zeroext i1 @_Z3tgtcc(i8 signext %22, i8 signext %23)
  %25 = zext i1 %24 to i32
  %26 = icmp eq i32 %21, %25
  br i1 %26, label %27, label %30

27:                                               ; preds = %17
  %28 = load i32, i32* %2, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %2, align 4
  br label %33

30:                                               ; preds = %17
  %31 = load i32, i32* %3, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %3, align 4
  br label %33

33:                                               ; preds = %30, %27
  %34 = load i8, i8* %4, align 1
  %35 = zext i8 %34 to i32
  %36 = load i8, i8* %5, align 1
  %37 = zext i8 %36 to i32
  %38 = load i8, i8* %4, align 1
  %39 = load i8, i8* %5, align 1
  %40 = call i1 @_Z3srccc(i8 signext %38, i8 signext %39)
  %41 = zext i1 %40 to i32
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i32 %35, i32 %37, i32 %41)
  %43 = load i8, i8* %4, align 1
  %44 = zext i8 %43 to i32
  %45 = load i8, i8* %5, align 1
  %46 = zext i8 %45 to i32
  %47 = load i8, i8* %4, align 1
  %48 = load i8, i8* %5, align 1
  %49 = call i1 @_Z3tgtcc(i8 signext %47, i8 signext %48)
  %50 = zext i1 %49 to i32
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i32 %44, i32 %46, i32 %50)
  br label %52

52:                                               ; preds = %33
  %53 = load i8, i8* %5, align 1
  %54 = add i8 %53, 1
  store i8 %54, i8* %5, align 1
  br label %13

55:                                               ; preds = %13
  br label %56

56:                                               ; preds = %55
  %57 = load i8, i8* %4, align 1
  %58 = add i8 %57, 1
  store i8 %58, i8* %4, align 1
  br label %8

59:                                               ; preds = %8
  store i8 62, i8* %6, align 1
  store i8 0, i8* %7, align 1
  %60 = load i8, i8* %6, align 1
  %61 = zext i8 %60 to i32
  %62 = load i8, i8* %7, align 1
  %63 = zext i8 %62 to i32
  %64 = load i8, i8* %6, align 1
  %65 = load i8, i8* %7, align 1
  %66 = call i1 @_Z3srccc(i8 signext %64, i8 signext %65)
  %67 = zext i1 %66 to i32
  %68 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i32 %61, i32 %63, i32 %67)
  %69 = load i8, i8* %6, align 1
  %70 = zext i8 %69 to i32
  %71 = load i8, i8* %7, align 1
  %72 = zext i8 %71 to i32
  %73 = load i8, i8* %6, align 1
  %74 = load i8, i8* %7, align 1
  %75 = call i1 @_Z3tgtcc(i8 signext %73, i8 signext %74)
  %76 = zext i1 %75 to i32
  %77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0), i32 %70, i32 %72, i32 %76)
  %78 = load i32, i32* %2, align 4
  %79 = load i32, i32* %3, align 4
  %80 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i64 0, i64 0), i32 %78, i32 %79)
  %81 = load i32, i32* %1, align 4
  ret i32 %81
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
