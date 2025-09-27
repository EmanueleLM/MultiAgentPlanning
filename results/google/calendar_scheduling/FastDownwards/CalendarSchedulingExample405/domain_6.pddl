(define (domain schedule-meeting)
  (:requirements :typing :strips)
  (:types participant slot meeting)

  (:constants emily brian gerald julia logan judith michael - participant)

  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled-at ?m - meeting ?s - slot)
    (attends ?p - participant ?m - meeting)
    (next ?s1 - slot ?s2 - slot)
    (work-slot ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (work-slot ?s)
      (free emily ?s) (free brian ?s) (free gerald ?s) (free julia ?s)
      (free logan ?s) (free judith ?s) (free michael ?s)
    )
    :effect (and
      (scheduled-at ?m ?s)
      (attends emily ?m) (attends brian ?m) (attends gerald ?m) (attends julia ?m)
      (attends logan ?m) (attends judith ?m) (attends michael ?m)
      (not (free emily ?s)) (not (free brian ?s)) (not (free gerald ?s)) (not (free julia ?s))
      (not (free logan ?s)) (not (free judith ?s)) (not (free michael ?s))
    )
  )
)