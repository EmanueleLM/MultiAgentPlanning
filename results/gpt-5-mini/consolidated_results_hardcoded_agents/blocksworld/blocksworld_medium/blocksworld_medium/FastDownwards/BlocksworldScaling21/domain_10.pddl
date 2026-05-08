(define (domain blocksworld-temporal)
  (:requirements :strips :typing :negative-preconditions)
  (:types block slot)

  (:predicates
    (on ?b - block ?c - block)            ; ?b is directly on ?c
    (on-table ?b - block)                 ; ?b is on the table
    (clear ?b - block)                    ; nothing is on top of ?b and ?b is not held
    (holding ?b - block)                  ; the hand is holding ?b
    (handempty)                           ; the hand is empty
    (current ?s - slot)                   ; current discrete stage marker
    (slot-next ?s1 - slot ?s2 - slot)     ; immediate successor relation between slots
  )

  ;; Pick up a clear block that is on the table. Advance the current slot to its immediate successor.
  (:action pickup
    :parameters (?b - block ?s - slot ?s2 - slot)
    :precondition (and
      (on-table ?b)
      (clear ?b)
      (handempty)
      (current ?s)
      (slot-next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (on-table ?b))
      (not (clear ?b))
      (not (handempty))

      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unstack a clear block ?b from on top of block ?c. Advance the current slot to its immediate successor.
  (:action unstack
    :parameters (?b - block ?c - block ?s - slot ?s2 - slot)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (current ?s)
      (slot-next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?c))
      (clear ?c)
      (not (clear ?b))
      (not (handempty))

      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down a held block onto the table. Advance the current slot to its immediate successor.
  (:action putdown
    :parameters (?b - block ?s - slot ?s2 - slot)
    :precondition (and
      (holding ?b)
      (current ?s)
      (slot-next ?s ?s2)
    )
    :effect (and
      (on-table ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))

      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack a held block ?b on top of a clear block ?c. Destination becomes not clear. Advance the current slot.
  (:action stack
    :parameters (?b - block ?c - block ?s - slot ?s2 - slot)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (current ?s)
      (slot-next ?s ?s2)
    )
    :effect (and
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (on-table ?b))

      (not (current ?s))
      (current ?s2)
    )
  )
)