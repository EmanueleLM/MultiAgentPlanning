(define (domain blocksworld-scaling10-domain)
  :requirements :strips :typing :negative-preconditions
  :types place block
  :predicates
    (on ?b - block ?p - place)        ; block ?b is on place ?p (place = block or table)
    (ontable ?b - block)              ; block ?b is directly on the table
    (clear ?p - place)                ; place ?p has nothing on top of it
    (holding ?b - block)              ; the agent is holding block ?b
    (handempty)                       ; the agent's hand is empty
  ; Standard blocksworld actions (STRIPS-style)
  ; Pick a block up from the table
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (handempty))
      (holding ?b)
    )
  )
  ; Put a held block down onto the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
    )
  )
  ; Stack a held block onto another block
  (:action stack
    :parameters (?b - block ?p - block)
    :precondition (and (holding ?b) (clear ?p))
    :effect (and
      (on ?b ?p)
      (clear ?b)
      (not (clear ?p))
      (not (holding ?b))
      (handempty)
    )
  )
  ; Unstack a block from another block (pick it up)
  (:action unstack
    :parameters (?b - block ?p - block)
    :precondition (and (on ?b ?p) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (on ?b ?p))
      (clear ?p)
      (not (handempty))
    )
  )
)