(define (domain assembly-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location part phase)

  (:predicates
    (at ?a - agent ?l - location)
    (part-at ?p - part ?l - location)
    (holding ?a - agent ?p - part)
    (in-assembly ?p - part)
    (assembled)
    (tested)
    (current-phase ?ph - phase)
    (phase-next ?p1 - phase ?p2 - phase)
  )

  ;; MOVE: any agent can move between locations
  (:action move
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (at ?a ?from)
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  ;; Phase 1 actions (workerA must fetch base and deliver to assembly stand)
  ;; pick base by workerA while in the phase
  (:action workerA-pick-base
    :parameters (?loc - location)
    :precondition (and
      (current-phase phase1)
      (at workerA ?loc)
      (part-at base ?loc)
      (not (holding workerA base))
    )
    :effect (and
      (not (part-at base ?loc))
      (holding workerA base)
    )
  )

  ;; deliver base to assembly stand (advances to phase2)
  (:action workerA-deliver-base-to-assembly
    :parameters ()
    :precondition (and
      (current-phase phase1)
      (at workerA assembly_stand)
      (holding workerA base)
      (phase-next phase1 phase2)
    )
    :effect (and
      (not (holding workerA base))
      (in-assembly base)
      (not (current-phase phase1))
      (current-phase phase2)
    )
  )

  ;; Phase 2 actions (workerB must fetch component and deliver to assembly stand)
  (:action workerB-pick-component
    :parameters (?loc - location)
    :precondition (and
      (current-phase phase2)
      (at workerB ?loc)
      (part-at component ?loc)
      (not (holding workerB component))
    )
    :effect (and
      (not (part-at component ?loc))
      (holding workerB component)
    )
  )

  (:action workerB-deliver-component-to-assembly
    :parameters ()
    :precondition (and
      (current-phase phase2)
      (at workerB assembly_stand)
      (holding workerB component)
      (phase-next phase2 phase3)
    )
    :effect (and
      (not (holding workerB component))
      (in-assembly component)
      (not (current-phase phase2))
      (current-phase phase3)
    )
  )

  ;; Phase 3: workerA attaches parts (requires both parts in assembly)
  (:action workerA-attach-parts
    :parameters ()
    :precondition (and
      (current-phase phase3)
      (at workerA assembly_stand)
      (in-assembly base)
      (in-assembly component)
      (not assembled)
      (phase-next phase3 phase4)
    )
    :effect (and
      (not (in-assembly base))
      (not (in-assembly component))
      (assembled)
      (not (current-phase phase3))
      (current-phase phase4)
    )
  )

  ;; Phase 4: workerB tests the assembled device
  (:action workerB-test-assembly
    :parameters ()
    :precondition (and
      (current-phase phase4)
      (at workerB assembly_stand)
      (assembled)
      (not tested)
      ;; allow a successor; final phase is phase_done but testing advances there
      (phase-next phase4 phase_done)
    )
    :effect (and
      (tested)
      (not (current-phase phase4))
      (current-phase phase_done)
    )
  )
)