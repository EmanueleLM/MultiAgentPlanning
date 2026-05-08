(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    alice bob jessica - person
    office l1 l2 l3 - loc
    ; slots: s0..s10 (s10 is the sentinel 'after last slot')
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - slot
  )

  (:init
    ;; Agent starts at 'office'
    (agent-at office)

    ;; Preferred meeting locations for each person (candidate schedules / auditor corrections integrated)
    (pref-loc alice l1)
    (pref-loc bob l2)
    (pref-loc jessica l3)

    ;; Availability windows (discrete 15-minute slots)
    ;; alice available s0..s5
    (person-available alice s0) (person-available alice s1) (person-available alice s2)
    (person-available alice s3) (person-available alice s4) (person-available alice s5)

    ;; bob available s2..s8
    (person-available bob s2) (person-available bob s3) (person-available bob s4)
    (person-available bob s5) (person-available bob s6) (person-available bob s7)
    (person-available bob s8)

    ;; jessica available s1..s9 (enough contiguous slots to permit a 6-slot = 90-minute meeting)
    (person-available jessica s1) (person-available jessica s2) (person-available jessica s3)
    (person-available jessica s4) (person-available jessica s5) (person-available jessica s6)
    (person-available jessica s7) (person-available jessica s8) (person-available jessica s9)

    ;; All working slots initially free
    (free s0) (free s1) (free s2) (free s3) (free s4) (free s5) (free s6) (free s7) (free s8) (free s9)

    ;; Successor chain to enforce contiguity and ordered consumption of slots
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)

    ;; The scheduling pointer starts at the first slot s0; all actions that consume time must start at current-slot.
    (current-slot s0)

    ;; total-cost starts at 0 (implicitly zero for numeric fluent)
  )

  ;; Mandated terminal conditions:
  ;; - Jessica must be met for at least 90 contiguous minutes: we enforce this by requiring (met jessica) and by ensuring only start-meeting-6 can set met for jessica (since other meeting actions require (not (met ?p)), and pref-loc and availability limit options).
  ;; - For every other person, either they are met or explicitly skipped; done-person must be achieved for each person.
  (:goal (and
    (met jessica)         ; hard constraint: Jessica must receive at least 90 contiguous minutes
    (done-person alice)   ; either met or skipped for alice
    (done-person bob)     ; either met or skipped for bob
    (done-person jessica) ; met-jessica also produces done-person jessica
  ))

  ;; Objective: minimize total-cost. skip-person increases total-cost by 1 per skipped person.
  (:metric minimize (total-cost))
)