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

  ;; PickUp: pick a clear block from the table into the (single) hand.
  ;; Preconditions: block is on the table, is clear, and the hand is empty.
  ;; Effects: block is held, no longer on the table, hand is not empty.
  (:action PickUp
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (handempty))
      (holding ?b)
      ;; clear remains true for the held block (semantics: nothing on top).
      ;; No explicit change to clear ?b here so the fact persists.
    )
  )

  ;; Unstack: take a clear block from on top of another block into the hand.
  ;; Preconditions: the block is on another block, the block itself is clear, and hand is empty.
  ;; Effects: block is held, removed from being on the other block, the support block becomes clear, hand not empty.
  (:action Unstack
    :parameters (?b - block ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handempty))
    :effect (and
      (not (on ?b ?x))
      (holding ?b)
      (not (handempty))
      (clear ?x)  ;; the block that was under ?b becomes clear after removal
      ;; clear ?b remains true (nothing on top of ?b while held)
    )
  )

  ;; PutDown: put a held block down onto the table.
  ;; Preconditions: the block is being held.
  ;; Effects: block becomes on the table, hand becomes empty, block is clear, no longer held.
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
  ;; Effects: held block becomes on target, target becomes not clear, hand becomes empty, no longer holding.
  (:action Stack
    :parameters (?b - block ?x - block)
    :precondition (and (holding ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (handempty)
      (not (holding ?b))
      (not (clear ?x))  ;; target now has something on top
      (clear ?b)        ;; moved block has nothing on top
    )
  )
)