(define (domain orchestrator-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?s - block)    ; ?b is on top of block ?s
    (ontable ?b - block)          ; ?b is on the table
    (clear ?b - block)            ; nothing on top of ?b and ?b is not being held
    (holding ?b - block)          ; the single hand is holding ?b
    (handempty)                   ; the single hand is empty
    (atstage ?t - stage)          ; current global stage/timepoint
    (next ?t1 - stage ?t2 - stage) ; successor relation between stages (static)
  )

  ;; Pick a clear block from the table into the hand, advance the global stage.
  (:action pick-up
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (handempty)
      (ontable ?b)
      (clear ?b)
      (atstage ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; stage progression
      (atstage ?t2)
      (not (atstage ?t))

      ;; block/hand effects
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Unstack a clear block from on top of another block into the hand, advance stage.
  (:action unstack
    :parameters (?b - block ?s - block ?t - stage ?t2 - stage)
    :precondition (and
      (handempty)
      (on ?b ?s)
      (clear ?b)
      (atstage ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; stage progression
      (atstage ?t2)
      (not (atstage ?t))

      ;; block/hand effects
      (holding ?b)
      (clear ?s)
      (not (on ?b ?s))
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Put the held block down on the table, advance stage.
  (:action put-down
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (atstage ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; stage progression
      (atstage ?t2)
      (not (atstage ?t))

      ;; block/hand effects
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
    )
  )

  ;; Stack the held block onto a clear target block, advance stage.
  (:action stack
    :parameters (?b - block ?tgt - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?tgt)
      (atstage ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; stage progression
      (atstage ?t2)
      (not (atstage ?t))

      ;; block/hand effects
      (on ?b ?tgt)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (clear ?tgt))
      (not (ontable ?b))
    )
  )
)