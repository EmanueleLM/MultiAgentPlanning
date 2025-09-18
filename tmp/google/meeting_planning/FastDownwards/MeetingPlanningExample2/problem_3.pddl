(define (problem integrated-meetup-problem)
  (:domain integrated-meetup)

  (:objects
    visitor jessica - person
    haight sunset - location
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 - slot
  )

  (:init
    (at visitor haight)
    (available jessica sunset)

    (available-slot jessica sunset s25) (available-slot jessica sunset s26)
    (available-slot jessica sunset s27) (available-slot jessica sunset s28)
    (available-slot jessica sunset s29) (available-slot jessica sunset s30)
    (available-slot jessica sunset s31) (available-slot jessica sunset s32)
    (available-slot jessica sunset s33) (available-slot jessica sunset s34)
    (available-slot jessica sunset s35) (available-slot jessica sunset s36)
    (available-slot jessica sunset s37) (available-slot jessica sunset s38)
    (available-slot jessica sunset s39) (available-slot jessica sunset s40)
    (available-slot jessica sunset s41) (available-slot jessica sunset s42)
    (available-slot jessica sunset s43) (available-slot jessica sunset s44)

    (next s0 s1)  (next s1 s2)  (next s2 s3)  (next s3 s4)
    (next s4 s5)  (next s5 s6)  (next s6 s7)  (next s7 s8)
    (next s8 s9)  (next s9 s10) (next s10 s11)(next s11 s12)
    (next s12 s13)(next s13 s14)(next s14 s15)(next s15 s16)
    (next s16 s17)(next s17 s18)(next s18 s19)(next s19 s20)
    (next s20 s21)(next s21 s22)(next s22 s23)(next s23 s24)
    (next s24 s25)(next s25 s26)(next s26 s27)(next s27 s28)
    (next s28 s29)(next s29 s30)(next s30 s31)(next s31 s32)
    (next s32 s33)(next s33 s34)(next s34 s35)(next s35 s36)
    (next s36 s37)(next s37 s38)(next s38 s39)(next s39 s40)
    (next s40 s41)(next s41 s42)(next s42 s43)(next s43 s44)
    (next s44 s45)

    (after6 s0 s6)  (after6 s1 s7)  (after6 s2 s8)  (after6 s3 s9)
    (after6 s4 s10) (after6 s5 s11) (after6 s6 s12) (after6 s7 s13)
    (after6 s8 s14) (after6 s9 s15) (after6 s10 s16)(after6 s11 s17)
    (after6 s12 s18)(after6 s13 s19)(after6 s14 s20)(after6 s15 s21)
    (after6 s16 s22)(after6 s17 s23)(after6 s18 s24)(after6 s19 s25)
    (after6 s20 s26)(after6 s21 s27)(after6 s22 s28)(after6 s23 s29)
    (after6 s24 s30)(after6 s25 s31)(after6 s26 s32)(after6 s27 s33)
    (after6 s28 s34)(after6 s29 s35)(after6 s30 s36)(after6 s31 s37)
    (after6 s32 s38)(after6 s33 s39)(after6 s34 s40)(after6 s35 s41)
    (after6 s36 s42)(after6 s37 s43)(after6 s38 s44)(after6 s39 s45)

    (time-at s0)

    (= (total-cost) 0)
  )

  (:goal (and (met jessica)))
  (:metric minimize (total-cost))
)