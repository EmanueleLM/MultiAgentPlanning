(define (domain orchestrated_blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent place phase)

  (:predicates
    (on ?b - block ?under - block)                ; block b is directly on block under
    (ontable ?b - block ?p - place)               ; block b is directly on table/place p
    (clear ?b - block)                            ; no block is on top of b
    (holding ?a - agent ?b - block)               ; agent a is holding block b
    (handempty ?a - agent)                        ; agent a holds nothing
    (phase-active ?ph - phase)                    ; phase ph is currently active
  )

  ;; Lifter picks a block from a table/place into its hand
  (:action lifter_pick_table
    :parameters (?l - agent ?b - block ?p - place)
    :precondition (and
      (handempty ?l)
      (ontable ?b ?p)
      (clear ?b)
      (phase-active liftPhase)
    )
    :effect (and
      (not (handempty ?l))
      (holding ?l ?b)
      (not (ontable ?b ?p))
    )
  )

  ;; Lifter picks a block from another block into its hand
  (:action lifter_pick_block
    :parameters (?l - agent ?b - block ?under - block)
    :precondition (and
      (handempty ?l)
      (on ?b ?under)
      (clear ?b)
      (phase-active liftPhase)
    )
    :effect (and
      (not (handempty ?l))
      (holding ?l ?b)
      (not (on ?b ?under))
      (clear ?under)
    )
  )

  ;; Lifter puts a held block down onto a table/place
  (:action lifter_put_table
    :parameters (?l - agent ?b - block ?p - place)
    :precondition (and
      (holding ?l ?b)
      (phase-active liftPhase)
    )
    :effect (and
      (handempty ?l)
      (not (holding ?l ?b))
      (ontable ?b ?p)
      (clear ?b)
    )
  )

  ;; Lifter hands a held block to the placer (transfer of holding)
  (:action lifter_handover
    :parameters (?l - agent ?pl - agent ?b - block)
    :precondition (and
      (holding ?l ?b)
      (handempty ?pl)
      (phase-active liftPhase)
    )
    :effect (and
      (not (holding ?l ?b))
      (handempty ?l)
      (not (handempty ?pl))
      (holding ?pl ?b)
    )
  )

  ;; Signal that lifting phase is complete and activate placement phase
  ;; This enforces strict ordering: placer actions require phase-active placePhase,
  ;; and the only way to activate it is this lifter action.
  (:action lifter_signal_done
    :parameters (?l - agent)
    :precondition (and
      (handempty ?l)                 ; lifter must have emptied its hand before signalling
      (phase-active liftPhase)
    )
    :effect (and
      (not (phase-active liftPhase))
      (phase-active placePhase)
    )
  )

  ;; Placer places a held block onto another block
  (:action placer_place_on_block
    :parameters (?pl - agent ?b - block ?under - block)
    :precondition (and
      (holding ?pl ?b)
      (clear ?under)
      (phase-active placePhase)
    )
    :effect (and
      (not (holding ?pl ?b))
      (handempty ?pl)
      (on ?b ?under)
      (not (clear ?under))
      (clear ?b)
    )
  )

  ;; Placer places a held block onto a table/place
  (:action placer_place_on_table
    :parameters (?pl - agent ?b - block ?p - place)
    :precondition (and
      (holding ?pl ?b)
      (phase-active placePhase)
    )
    :effect (and
      (not (holding ?pl ?b))
      (handempty ?pl)
      (ontable ?b ?p)
      (clear ?b)
    )
  )
)