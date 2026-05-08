(define (domain block-stacking-collab)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    picker_agent stacker_agent auditor_agent orchestrator_agent - agent
    block
    stage
  )

  (:predicates
    (on ?b - block ?c - block)
    (ontable ?b - block)
    (clear ?b - block)                 ; no block on top AND not currently held
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ; Picker actions
  (:action picker-pickup
    :parameters (?a - picker_agent ?b - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (handempty picker)
      (handempty stacker)
      (handempty auditor)
      (handempty orchestrator)
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      (not (ontable ?b))
      (holding picker ?b)
      (not (handempty picker))
      (not (clear ?b))
      (not (current ?s1)) (current ?s2)
    )
  )

  (:action picker-unstack
    :parameters (?a - picker_agent ?b - block ?c - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (handempty picker)
      (handempty stacker)
      (handempty auditor)
      (handempty orchestrator)
      (on ?b ?c)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?c))
      (holding picker ?b)
      (not (handempty picker))
      (clear ?c)
      (not (clear ?b))
      (not (current ?s1)) (current ?s2)
    )
  )

  (:action picker-putdown
    :parameters (?a - picker_agent ?b - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (holding picker ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding picker ?b))
      (handempty picker)
      (not (current ?s1)) (current ?s2)
    )
  )

  (:action picker-stack
    :parameters (?a - picker_agent ?b - block ?c - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (holding picker ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (not (holding picker ?b))
      (handempty picker)
      (not (current ?s1)) (current ?s2)
    )
  )

  ; Stacker actions (distinct agent)
  (:action stacker-pickup
    :parameters (?a - stacker_agent ?b - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (handempty picker)
      (handempty stacker)
      (handempty auditor)
      (handempty orchestrator)
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      (not (ontable ?b))
      (holding stacker ?b)
      (not (handempty stacker))
      (not (clear ?b))
      (not (current ?s1)) (current ?s2)
    )
  )

  (:action stacker-unstack
    :parameters (?a - stacker_agent ?b - block ?c - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (handempty picker)
      (handempty stacker)
      (handempty auditor)
      (handempty orchestrator)
      (on ?b ?c)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?c))
      (holding stacker ?b)
      (not (handempty stacker))
      (clear ?c)
      (not (clear ?b))
      (not (current ?s1)) (current ?s2)
    )
  )

  (:action stacker-putdown
    :parameters (?a - stacker_agent ?b - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (holding stacker ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding stacker ?b))
      (handempty stacker)
      (not (current ?s1)) (current ?s2)
    )
  )

  (:action stacker-stack
    :parameters (?a - stacker_agent ?b - block ?c - block ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1) (next ?s1 ?s2)
      (holding stacker ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (not (holding stacker ?b))
      (handempty stacker)
      (not (current ?s1)) (current ?s2)
    )
  )
)