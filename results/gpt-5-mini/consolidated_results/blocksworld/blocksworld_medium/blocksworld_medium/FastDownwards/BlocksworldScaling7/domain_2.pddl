(define (domain multi-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)        ; the single shared hand holds this block
    (handempty)                ; the single shared hand is empty
    (stage ?s - stage)
    (next ?s1 - stage ?s2 - stage) ; successor relation for contiguous stages
    (current ?s - stage)           ; the current global stage
  )

  ;; Picker actions: pick a block from the table or unstack a block from another block.
  ;; Each action consumes the current stage and advances to its successor (contiguous progression).
  ;; Negative precondition ensures successor is not already current (prevent reusing/skipping stages).
  (:action picker-pick-from-table
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (handempty))
      (not (clear ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action picker-unstack
    :parameters (?b - block ?below - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?below)
      (clear ?b)
      (handempty)
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?below))
      (clear ?below)     ; once removed, the supporting block becomes clear
      (not (handempty))
      (not (clear ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stacker actions: put down a held block on the table or stack it onto another block.
  ;; They also advance the global stage contiguously.
  (:action stacker-put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      (ontable ?b)
      (clear ?b)           ; a block placed on the table is clear (no block on top)
      (handempty)
      (not (holding ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action stacker-stack
    :parameters (?b - block ?target - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?target)
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      (on ?b ?target)
      (not (clear ?target)) ; the supporting block is no longer clear
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?s))
      (current ?s2)
    )
  )
)