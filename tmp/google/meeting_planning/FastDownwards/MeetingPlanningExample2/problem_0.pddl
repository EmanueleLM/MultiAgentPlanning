(define (problem integrated-meetup-problem)
  (:domain integrated-meetup)

  (:objects
    jessica - person
    haight sunset - location
    ;; slots represent 15-minute increments from 3:15PM to 8:15PM (20 slots)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 - slot
  )

  (:init
    ;; Start location at 9:00AM -> clock = 0
    (at haight)

    ;; Agent1 view: Jessica is available at Sunset District (location-based fact)
    (available jessica sunset)

    ;; Agent2 view: Jessica's slot-by-slot availability at Sunset (s0..s19 => 3:15PM..8:15PM)
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

    ;; Consecutive-slot relations (15-minute steps)
    (next s0 s1)  (next s1 s2)  (next s2 s3)  (next s3 s4)
    (next s4 s5)  (next s5 s6)  (next s6 s7)  (next s7 s8)
    (next s8 s9)  (next s9 s10) (next s10 s11)(next s11 s12)
    (next s12 s13)(next s13 s14)(next s14 s15)(next s15 s16)
    (next s16 s17)(next s17 s18)(next s18 s19)

    ;; Numeric fluents
    (= (clock) 0)
    (= (score) 0)

    ;; Contextual info (kept as comments in the original agent files):
    ;; - You arrive at Haight-Ashbury at 9:00AM.
    ;; - Travel time between Haight and Sunset is modeled as a1-travel with duration 15.
  )

  ;; Goal: ensure Jessica is met; metric maximizes score to prefer meeting as many friends as possible.
  (:goal (and (met jessica)))
  (:metric maximize (score))
)