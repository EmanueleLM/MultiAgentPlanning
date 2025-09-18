(define (problem integrated-meetup-problem)
  (:domain integrated-meetup)

  (:objects
    jessica - person
    haight sunset - location
    start s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 - slot
  )

  (:init
    ;; Location
    (at haight)

    ;; Agent1 view: Jessica available at Sunset
    (available jessica sunset)

    ;; Agent2 slot availability (Jessica at Sunset for all slots s0..s19)
    (available-slot jessica sunset s0)  (available-slot jessica sunset s1)
    (available-slot jessica sunset s2)  (available-slot jessica sunset s3)
    (available-slot jessica sunset s4)  (available-slot jessica sunset s5)
    (available-slot jessica sunset s6)  (available-slot jessica sunset s7)
    (available-slot jessica sunset s8)  (available-slot jessica sunset s9)
    (available-slot jessica sunset s10) (available-slot jessica sunset s11)
    (available-slot jessica sunset s12) (available-slot jessica sunset s13)
    (available-slot jessica sunset s14) (available-slot jessica sunset s15)
    (available-slot jessica sunset s16) (available-slot jessica sunset s17)
    (available-slot jessica sunset s18) (available-slot jessica sunset s19)

    ;; Time progression relations: start -> s0 .. s18 -> s19
    (next start s0)
    (next s0 s1)  (next s1 s2)  (next s2 s3)  (next s3 s4)
    (next s4 s5)  (next s5 s6)  (next s6 s7)  (next s7 s8)
    (next s8 s9)  (next s9 s10) (next s10 s11)(next s11 s12)
    (next s12 s13)(next s13 s14)(next s14 s15)(next s15 s16)
    (next s16 s17)(next s17 s18)(next s18 s19)

    ;; after6 relations: mapping a start slot to the slot immediately after six consecutive slots
    (after6 s0 s6)  (after6 s1 s7)  (after6 s2 s8)  (after6 s3 s9)
    (after6 s4 s10) (after6 s5 s11) (after6 s6 s12) (after6 s7 s13)
    (after6 s8 s14) (after6 s9 s15) (after6 s10 s16)(after6 s11 s17)
    (after6 s12 s18)(after6 s13 s19)

    ;; Initial time is before s0 (9:00AM represented as start); planner can advance to s0..s19
    (time-at start)

    ;; Total cost starts at 0
    (= (total-cost) 0)
  )

  (:goal (and (met jessica)))
  (:metric minimize (total-cost))
)