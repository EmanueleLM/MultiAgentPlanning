(define (domain arrange-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types object slot)

  (:predicates
    (placed ?o - object)                     ; object has been placed into a slot
    (at ?o - object ?s - slot)               ; object is at a particular slot
    (empty ?s - slot)                        ; slot contains no object
    (successor ?s1 - slot ?s2 - slot)        ; s2 is the immediate successor of s1
    (next ?o1 - object ?o2 - object)         ; o1 is immediately followed by o2 in sequence
  )

  ;; Place an object into any empty slot (no adjacency relationships are created by this action).
  (:action place-initial
    :parameters (?o - object ?s - slot)
    :precondition (and
      (empty ?s)
      (not (placed ?o))
    )
    :effect (and
      (at ?o ?s)
      (placed ?o)
      (not (empty ?s))
    )
  )

  ;; Place an object directly after a predecessor object already placed in a slot
  ;; This action requires that the predecessor occupies a slot with an explicit successor slot
  ;; and that the successor slot is currently empty. The action establishes both the placement
  ;; and the adjacency relation (next predecessor -> object).
  (:action place-after
    :parameters (?o - object ?pred - object ?s_pred - slot ?s_new - slot)
    :precondition (and
      (placed ?pred)
      (at ?pred ?s_pred)
      (successor ?s_pred ?s_new)
      (empty ?s_new)
      (not (placed ?o))
    )
    :effect (and
      (at ?o ?s_new)
      (placed ?o)
      (not (empty ?s_new))
      (next ?pred ?o)
    )
  )
)