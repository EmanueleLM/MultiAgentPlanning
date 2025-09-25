(define (domain meet-betty-combined)
  (:requirements :strips :durative-actions :typing :negative-preconditions :numeric-fluents)
  (:types location)
  (:predicates
    (at-you ?loc - location)
    (at-betty ?loc - location)
    (met)
  )
  (:functions
    (time)  ; minutes since midnight
  )

  ;; ---------- Agent 1 actions (durative) ----------
  ;; Travel from Richmond to Financial: 22 minutes
  (:durative-action agent1_travel_richmond_to_financial
    :duration (= ?duration 22)
    :condition (and
      (at start (at-you richmond))
    )
    :effect (and
      (at end (not (at-you richmond)))
      (at end (at-you financial))
      (at end (increase (time) 22))
    )
  )

  ;; Travel from Financial to Richmond: 21 minutes
  (:durative-action agent1_travel_financial_to_richmond
    :duration (= ?duration 21)
    :condition (and
      (at start (at-you financial))
    )
    :effect (and
      (at end (not (at-you financial)))
      (at end (at-you richmond))
      (at end (increase (time) 21))
    )
  )

  ;; Wait action to advance time while staying at Richmond.
  (:durative-action agent1_wait_until_17_15_at_richmond
    :duration (= ?duration 495) ;; from 09:00 (540) to 17:15 (1035) = 495
    :condition (and
      (at start (at-you richmond))
    )
    :effect (and
      (at end (increase (time) 495))
    )
  )

  ;; Meeting action: requires you and Betty at Financial, start between 1035 and 1245, lasts 60
  (:durative-action agent1_meet_betty_at_financial
    :duration (= ?duration 60)
    :condition (and
      (at start (at-you financial))
      (at start (at-betty financial))
      (at start (>= (time) 1035))
      (at start (<= (time) 1245))
    )
    :effect (and
      (at end (met))
      (at end (increase (time) 60))
    )
  )

  ;; ---------- Agent 2 actions (instantaneous) ----------
  ;; These actions are kept distinct from Agent 1's, adapted to use the same predicates/functions.

  ;; Travel from Richmond to Financial: 22 minutes (instant action representation)
  (:action agent2_travel_rd_to_fd
    :precondition (at-you richmond)
    :effect (and
      (not (at-you richmond))
      (at-you financial)
      (increase (time) 22)
    )
  )

  ;; Travel from Financial to Richmond: 21 minutes
  (:action agent2_travel_fd_to_rd
    :precondition (at-you financial)
    :effect (and
      (not (at-you financial))
      (at-you richmond)
      (increase (time) 21)
    )
  )

  ;; Wait/jump forward to the start of Betty's availability window (set time to 1035 if earlier)
  (:action agent2_wait_until_window
    :precondition (<= (time) 1035)
    :effect (assign (time) 1035)
  )

  ;; Meet Betty for 60 minutes at Financial District (instant start, advances time by 60)
  (:action agent2_meet_betty
    :precondition (and
      (at-you financial)
      (at-betty financial)
      (>= (time) 1035)
      (<= (time) 1245)  ;; latest allowed start so 60-minute meeting fits before 1305 (21:45)
    )
    :effect (and
      (assign (time) (+ (time) 60))
      (met)
    )
  )
)