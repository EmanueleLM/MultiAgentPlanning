(define (problem meet-thomas-day)
  (:domain meet-friends)
  (:objects bayview pacific-heights - location)
  (:init
    ; Traveler arrives at Bayview at 09:00 = 540 minutes
    (= (time) 540)
    (= (met-count) 0)
    (at-traveler bayview)
    ; Encode Thomas availability implicitly via meeting time constraints in the meet action:
    ; Thomas is at Pacific Heights from 12:15 (735) to 17:15 (1035).
    ; The meet-with-thomas action requires start in [735,930] and lasts 105 minutes.
  )
  (:goal (and
    ; Hard constraint: must meet Thomas for at least 105 minutes (encoded by making meet-with-thomas a required step)
    (met-thomas)
  ))
  ; Objective: maximize number of friends met (met-count). Only the meeting with Thomas is encoded here;
  ; if more friends are added later they could increment met-count as additional actions.
  (:metric maximize (met-count))
)