(define (domain blocksworld-manipulator)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    block - place
    place
    stage
  )
  (:predicates
    (on ?b - block ?p - place)    ; b is immediately on place p (either a block or the table)
    (clear ?b - block)            ; no block on top of b AND b is not being held
    (holding ?b - block)          ; the single hand is holding b
    (hand-empty)                  ; the hand holds nothing
    (succ ?s1 - stage ?s2 - stage) ; successor relation between stages
    (current ?s - stage)          ; which stage is currently active
  )

  ;; pick-up: pick a clear block from the table into the hand and advance the current stage
  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand-empty)
      (clear ?b)
      (on ?b table)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (holding ?b)
      (not (hand-empty))
      (not (on ?b table))
      (not (clear ?b))
    )
  )

  ;; unstack: pick a clear top block ?b from directly on block ?support into the hand and advance stage
  (:action unstack
    :parameters (?b - block ?support - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand-empty)
      (clear ?b)
      (on ?b ?support)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (holding ?b)
      (not (hand-empty))
      (not (on ?b ?support))
      (not (clear ?b))
      (clear ?support)
    )
  )

  ;; put-down: place a held block onto the table and advance stage
  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (on ?b table)
      (clear ?b)
      (hand-empty)
      (not (holding ?b))
    )
  )

  ;; stack: place a held block ?b onto a clear support block ?support and advance stage
  (:action stack
    :parameters (?b - block ?support - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (holding ?b)
      (clear ?support)
      (not (= ?b ?support))
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (on ?b ?support)
      (clear ?b)
      (hand-empty)
      (not (holding ?b))
      (not (clear ?support))
    )
  )
)