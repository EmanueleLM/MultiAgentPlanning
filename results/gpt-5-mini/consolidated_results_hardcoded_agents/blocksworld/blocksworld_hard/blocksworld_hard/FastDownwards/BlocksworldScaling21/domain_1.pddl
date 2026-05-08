(define (domain blocksworld)
  :requirements :strips :typing :negative-preconditions
  :types block stage
  :predicates
    (clear ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (holding ?b - block)
    (handempty)
    (stage ?s - stage)
    (next ?s - stage ?t - stage)
  )

  ;; PickUp: take a clear block from the table into the single hand,
  ;; and advance the global stage from ?s to its successor ?t.
  (:action PickUp
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and
      (clear ?b)
      (ontable ?b)
      (handempty)
      (stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (stage ?s))
      (stage ?t)
    )
  )

  ;; Unstack: take a clear block from on top of another block into the single hand,
  ;; making the supporting block clear, and advance stage.
  (:action Unstack
    :parameters (?b - block ?c - block ?s - stage ?t - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
      (not (stage ?s))
      (stage ?t)
    )
  )

  ;; PutDown: place a held block down on the table, making it clear and freeing the hand, advance stage.
  (:action PutDown
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and
      (holding ?b)
      (stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (stage ?s))
      (stage ?t)
    )
  )

  ;; Stack: place a held block on top of a clear block, update clear flags and hand, advance stage.
  (:action Stack
    :parameters (?b - block ?c - block ?s - stage ?t - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (holding ?b))
      (not (clear ?c))
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (stage ?s))
      (stage ?t)
    )
  )
)