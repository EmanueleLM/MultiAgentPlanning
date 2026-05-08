(define (domain blocksworld-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types place step block - place)  ; blocks are a subtype of place so they can be places for other blocks

  (:predicates
    (on ?b - block ?p - place)      ; block ?b is on place ?p (place may be table or another block)
    (clear ?b - block)              ; block ?b has nothing on top of it
    (handempty)                     ; the hand is empty
    (holding ?b - block)            ; the hand holds block ?b
    (allowed ?s - step)             ; stage ?s is the active stage
    (next ?s - step ?t - step)      ; stage ordering: ?t follows ?s
  )

  ;; Pick up a block from the table (must be clear and hand empty), advances stage
  (:action pickup-from-table
    :parameters (?b - block ?s - step ?s2 - step ?table - place)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (handempty)
      (on ?b ?table)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?table))
      (not (clear ?b))
      (not (handempty))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  ;; Unstack a block from another block (must be clear and hand empty), advances stage
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
      (clear ?under)
      (not (handempty))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  ;; Put the held block down on the table (or any place object specified as table), advances stage
  (:action putdown
    :parameters (?b - block ?s - step ?s2 - step ?p - place)
    :precondition (and
      (allowed ?s)
      (next ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (on ?b ?p)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )

  ;; Stack the held block onto another clear block, advances stage
  (:action stack
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
      (not (clear ?target))
      (handempty)
      (not (holding ?b))
      (not (allowed ?s))
      (allowed ?s2)
    )
  )
)