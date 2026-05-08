(define (problem meeting_planning_problem)
  (:domain meeting_planning_domain)
  (:objects
    nob_hill sunset_district - location
    t0900 t0925 t1400 t1515 t2030 - time
    carol - friend
  )
  (:init
    ;; Starting state: User arrives at Nob Hill at 9:00 AM.
    (at nob_hill)
    (time t0900)

    ;; Travel connectivity and duration: Nob Hill to Sunset District takes 25 minutes.
    ;; 9:00 AM + 25 minutes = 9:25 AM.
    (can_move nob_hill sunset_district t0900 t0925)

    ;; Chronological order of time points for the wait action.
    (next t0900 t0925)
    (next t0925 t1400)
    (next t1400 t1515)
    (next t1515 t2030)

    ;; Carol's availability and meeting requirement.
    ;; Carol is at Sunset District from 2:00 PM (t1400) to 8:30 PM (t2030).
    ;; A 75-minute meeting starting at 2:00 PM ends at 3:15 PM (t1515).
    ;; This interval [14:00, 15:15] is within Carol's window [14:00, 20:30].
    (can_meet carol sunset_district t1400 t1515)
  )
  (:goal
    ;; The objective is to meet Carol, satisfying all constraints.
    (has_met carol)
  )
)