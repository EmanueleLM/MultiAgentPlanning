(define (domain BlocksworldScaling6)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:predicates
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; PickUp: pick a clear block from the table into the (single) hand,
  ;; advancing the discrete stage from ?s to its successor ?s2.
  (:action PickUp
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unstack: remove a clear block ?b that is on ?c, hold it, advance stage.
  (:action Unstack
    :parameters (?b - block ?c - block ?s - step ?s2 - step)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (current ?s)
      (next ?s ?s2)
      (not (= ?b ?c))
    )
    :effect (and
      (not (on ?b ?c))
      (clear ?c)
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; PutDown: put the held block on the table, making hand empty, advance stage.
  (:action PutDown
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?b)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack: place the held block ?b on top of distinct block ?c that is clear,
  ;; making ?c not clear, ?b no longer held, advance stage.
  (:action Stack
    :parameters (?b - block ?c - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (current ?s)
      (next ?s ?s2)
      (not (= ?b ?c))
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty)
      (not (holding ?b))
      (not (ontable ?b))
      (not (current ?s))
      (current ?s2)
    )
  )
)