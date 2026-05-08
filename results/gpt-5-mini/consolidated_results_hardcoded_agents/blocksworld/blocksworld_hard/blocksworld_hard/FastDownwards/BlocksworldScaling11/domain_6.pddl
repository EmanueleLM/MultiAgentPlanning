(define (domain blocksworld-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types place step block - place table - place)  ; blocks and the table are kinds of places so they can be targets for "on"

  (:predicates
    (on ?b - block ?p - place)      ; block ?b is on place ?p (place may be table or another block)
    (clear ?b - block)              ; block ?b has nothing on top of it (and is not being held)
    (handempty)                     ; the hand is empty
    (holding ?b - block)            ; the hand holds block ?b
    (allowed ?s - step)             ; stage ?s is the currently active stage
    (next ?s - step ?t - step)      ; stage ordering: ?t follows ?s
  )

  ;; Pick up a block from the table (must be clear and hand empty), advances stage
  (:action pickup-from-table
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (handempty)
      (on ?b table)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (not (on ?b table))
      (not (clear ?b))   ; a held block is not clear (clear requires not held)
      (not (handempty))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  ;; Unstack a block from on top of another block (must be clear and hand empty), advances stage
  (:action unstack
    :parameters (?b - block ?under - block ?s - step ?s2 - step)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (handempty)
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?under))
      (not (clear ?b))
      (clear ?under)     ; the block that was under becomes clear after removing the top block
      (not (handempty))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  ;; Put the held block down on the table, advances stage
  (:action putdown-on-table
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (on ?b table)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  ;; Stack the held block onto another clear block, advances stage
  (:action stack-onto-block
    :parameters (?b - block ?target - block ?s - step ?s2 - step)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (holding ?b)
      (clear ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))  ; once stacked, the target is no longer clear
      (handempty)
      (not (holding ?b))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )
)