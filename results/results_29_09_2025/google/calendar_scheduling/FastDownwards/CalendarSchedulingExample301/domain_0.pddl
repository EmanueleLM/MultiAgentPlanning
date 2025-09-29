(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:predicates
    (available ?p - participant ?s - slot)    ; participant p is available at slot s
    (attended  ?p - participant ?s - slot)    ; participant p has been marked attending at slot s
    (meeting-scheduled ?s - slot)             ; meeting has been scheduled at slot s
  )

  ;; An attend action that can be applied only when the participant is available for that slot.
  (:action attend
    :parameters (?p - participant ?s - slot)
    :precondition (available ?p ?s)
    :effect (attended ?p ?s)
  )

  ;; A schedule action that marks a slot as scheduled. The problem goal will require
  ;; that all participants have attended the same slot and that the slot is scheduled.
  ;; (We leave the schedule action without preconditions so the planner may
  ;; place it after all attend actions; the goal enforces that all participants attended.)
  (:action schedule
    :parameters (?s - slot)
    :precondition ()
    :effect (meeting-scheduled ?s)
  )
)