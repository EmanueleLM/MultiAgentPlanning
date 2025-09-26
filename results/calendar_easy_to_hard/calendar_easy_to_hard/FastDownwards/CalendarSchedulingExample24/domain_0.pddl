(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)        ; participant ?p is free at slot ?s (initial-state encoded)
    (attended ?p - person ?s - slot)    ; participant ?p attends meeting at slot ?s (set by actions)
    (chosen ?s - slot)                  ; the planner chooses slot ?s (goal will require this)
    (person ?p - person)
    (slot ?s - slot)
  )

  ;; Action to mark that a participant attends the meeting in a given slot.
  ;; Precondition enforces participant is free in that slot (hard constraint).
  (:action attend
    :parameters (?p - person ?s - slot)
    :precondition (free ?p ?s)
    :effect (attended ?p ?s)
  )

  ;; Action to choose a slot as the meeting time. The problem goal will require
  ;; the chosen slot and attendance by every participant at that same slot.
  ;; No preconditions here; the goal will force chosen slot to match the attended slot(s).
  (:action choose
    :parameters (?s - slot)
    :precondition ()
    :effect (chosen ?s)
  )
)