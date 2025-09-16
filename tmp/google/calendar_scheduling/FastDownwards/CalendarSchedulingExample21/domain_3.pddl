(define (domain integrated-meeting-scheduler)
  (:requirements :typing)
  (:types slot person)

  (:predicates
    (free-a ?t - slot)
    (available-a ?p - person ?t - slot)
    (consecutive-a ?t1 - slot ?t2 - slot)

    (free-bp ?p - person ?s - slot)
    (adjacent-b ?s1 - slot ?s2 - slot)

    (free-c ?t - slot)
    (adjacent-c ?s1 - slot ?s2 - slot)

    (meeting-scheduled)
  )

  ; Unified action requiring all three sides
  (:action schedule-meeting-all
    :parameters (?t1 - slot ?t2 - slot)
    :precondition (and (free-a ?t1) (free-a ?t2)
                       (consecutive-a ?t1 ?t2)
                       (free-bp SCOTT ?t1) (free-bp SCOTT ?t2) (adjacent-b ?t1 ?t2)
                       (free-c ?t1) (free-c ?t2) (adjacent-c ?t1 ?t2)
                       (available-a BOBBY ?t1) (available-a BOBBY ?t2))
    :effect (and (not (free-a ?t1)) (not (free-a ?t2))
                 (not (free-bp SCOTT ?t1)) (not (free-bp SCOTT ?t2))
                 (not (free-c ?t1)) (not (free-c ?t2))
                 (meeting-scheduled))
  )
)