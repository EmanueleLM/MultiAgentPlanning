(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)
  (:predicates
    (clear ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (holding ?b - block)
    (handempty)
    (curr-stage ?s - stage)
    (next ?s - stage ?t - stage)
  )

  ;; PickUp: pick a clear block from the table when the hand is empty.
  ;; Advances the global stage by one (requires contiguous stage progression).
  (:action PickUp
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and
      (clear ?b)
      (ontable ?b)
      (handempty)
      (curr-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      ;; block is no longer on the table and is now held
      (not (ontable ?b))
      (not (clear ?b))   ;; by specification, a block being held is not clear
      (not (handempty))
      (holding ?b)

      ;; stage progression: consume ?s and produce ?t (enforces single action per stage)
      (not (curr-stage ?s))
      (curr-stage ?t)
    )
  )

  ;; Unstack: pick a clear block directly on top of another block when the hand is empty.
  ;; The supporting block becomes clear after the unstack.
  ;; Advances the global stage by one.
  (:action Unstack
    :parameters (?b - block ?c - block ?s - stage ?t - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (curr-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      ;; remove the on relation and hold the block
      (not (on ?b ?c))
      (not (clear ?b))   ;; held block is not clear per spec
      (not (handempty))
      (holding ?b)

      ;; the supporting block becomes clear (nothing on top)
      (clear ?c)

      ;; stage progression
      (not (curr-stage ?s))
      (curr-stage ?t)
    )
  )

  ;; PutDown: put a held block onto the table. Hand becomes empty after the action.
  ;; Advances the global stage by one.
  (:action PutDown
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and
      (holding ?b)
      (curr-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      ;; place block on the table, block becomes clear, and hand becomes empty
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)
      (handempty)

      ;; stage progression
      (not (curr-stage ?s))
      (curr-stage ?t)
    )
  )

  ;; Stack: stack a held block ?b onto a clear block ?c. Hand becomes empty after the action.
  ;; After stacking, the supporting block ?c is no longer clear; the placed block ?b is clear.
  ;; Advances the global stage by one.
  (:action Stack
    :parameters (?b - block ?c - block ?s - stage ?t - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (curr-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      ;; place b on c
      (not (holding ?b))
      (not (clear ?c)) ;; the block that receives ?b is no longer clear
      (on ?b ?c)
      (clear ?b)       ;; by definition, the placed block has nothing on top
      (handempty)
      (not (ontable ?b)) ;; ensure it's not on the table

      ;; stage progression
      (not (curr-stage ?s))
      (curr-stage ?t)
    )
  )
)