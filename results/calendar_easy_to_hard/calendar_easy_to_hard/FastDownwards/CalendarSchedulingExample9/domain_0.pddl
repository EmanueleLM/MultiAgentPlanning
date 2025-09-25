(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)

  (:predicates
    (slot ?s - slot)
    (person ?p - person)
    (free ?p - person ?s - slot)            ;; person is available in that 30-min slot
    (meeting-scheduled ?s - slot)           ;; meeting has been scheduled at this slot
    (attended ?p - person)                  ;; person will attend the scheduled meeting
  )

  ;; Actions kept distinct per agent (diane / kelly / deborah).
  ;; Any of these agents can schedule the meeting provided both participants are free in that slot.
  ;; Effects mark the meeting scheduled at the chosen slot and mark both participants as attending.
  (:action schedule-by-diane
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free diane_kelly ?s) (free deborah ?s))
    :effect (and
              (meeting-scheduled ?s)
              (attended diane_kelly)
              (attended deborah)
              (not (free diane_kelly ?s))
              (not (free deborah ?s))
            )
  )

  (:action schedule-by-kelly
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free diane_kelly ?s) (free deborah ?s))
    :effect (and
              (meeting-scheduled ?s)
              (attended diane_kelly)
              (attended deborah)
              (not (free diane_kelly ?s))
              (not (free deborah ?s))
            )
  )

  (:action schedule-by-deborah
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free diane_kelly ?s) (free deborah ?s))
    :effect (and
              (meeting-scheduled ?s)
              (attended diane_kelly)
              (attended deborah)
              (not (free diane_kelly ?s))
              (not (free deborah ?s))
            )
  )
)