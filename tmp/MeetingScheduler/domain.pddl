```lisp
(define (domain combined-schedule)
  (:requirements :strips :typing)
  
  ;; Define participant-specific predicates
  (:predicates 
    ; Participant 1 predicates
    (p1-available ?time)
    (p1-meeting-scheduled ?start ?end)
    (p1-next ?t1 ?t2)

    ; Participant 2 predicates
    (p2-available ?t - time-slot)         
    (p2-meeting-duration ?t1 ?t2 - time-slot)

    ; Participant 3 predicates
    (p3-available ?time)
    (p3-meeting-scheduled ?time1 ?time2)
  )

  ;; Define actions for each participant
  (:action schedule-p1-meeting
    :parameters (?start ?end)
    :precondition (and
      (p1-available ?start)
      (p1-available ?end)
      (p1-next ?start ?end)
    )
    :effect (p1-meeting-scheduled ?start ?end)
  )

  (:action schedule-p2-meeting
    :parameters (?t1 ?t2 - time-slot)
    :precondition (and (p2-available ?t1) (p2-available ?t2) (p2-meeting-duration ?t1 ?t2))
    :effect (and (not (p2-available ?t1)) (not (p2-available ?t2)) (scheduled))
  )
  
  (:action schedule-p3-meeting
    :parameters (?time1 ?time2)
    :precondition (and (p3-available ?time1) (p3-available ?time2))
    :effect (p3-meeting-scheduled ?time1 ?time2)
  )
)
```