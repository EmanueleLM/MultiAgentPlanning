(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (handempty)
    (holding ?b - block)
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
  )

  ;; PickUp: pick a clear block from the table into the single hand.
  ;; Preconditions: block is on the table, is clear, and the hand is empty.
  ;; Effects: block becomes held, removed from table, hand no longer empty, block is not clear while held.
  (:action PickUp
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (handempty))
      (holding ?b)
      (not (clear ?b))
    )
  )

  ;; Unstack: take a clear block from on top of another block into the hand.
  ;; Preconditions: the block is on another block, the block itself is clear, and hand is empty.
  ;; Effects: block becomes held, removed from on relation, support becomes clear, hand no longer empty, block is not clear while held.
  (:action Unstack
    :parameters (?b - block ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handempty))
    :effect (and
      (not (on ?b ?x))
      (holding ?b)
      (not (handempty))
      (clear ?x)
      (not (clear ?b))
    )
  )

  ;; PutDown: put a held block down onto the table.
  ;; Preconditions: the block is being held.
  ;; Effects: block placed on table, hand becomes empty, no longer holding block, block becomes clear (not held and nothing on top).
  (:action PutDown
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (handempty)
      (not (holding ?b))
      (clear ?b)
    )
  )

  ;; Stack: place a held block on top of a clear block.
  ;; Preconditions: the block is held and the target block is clear.
  ;; Effects: held block placed on target, target no longer clear, hand becomes empty, not holding the moved block, moved block becomes clear.
  (:action Stack
    :parameters (?b - block ?x - block)
    :precondition (and (holding ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (handempty)
      (not (holding ?b))
      (not (clear ?x))
      (clear ?b)
    )
  )
)