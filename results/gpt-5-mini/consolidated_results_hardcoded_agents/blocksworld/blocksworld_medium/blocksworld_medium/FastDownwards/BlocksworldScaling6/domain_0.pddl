(define (domain blocks-world)
  :requirements :strips :typing :negative-preconditions
  :types block

  :predicates
    (ontable ?b - block)     ; block is directly on the table
    (on ?b - block ?c - block) ; block ?b is on block ?c
    (clear ?b - block)       ; nothing on top of block
    (holding ?b - block)     ; robot is holding block
    (handempty)              ; robot's hand is empty

  ; PickUp: pick a clear block from the table when hand is empty
  (:action PickUp
    :parameters (?b - block)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (handempty))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty))
              (holding ?b))
  )

  ; Unstack: remove a clear block from on top of another block when hand is empty
  (:action Unstack
    :parameters (?b - block ?c - block)
    :precondition (and
                    (on ?b ?c)
                    (clear ?b)
                    (handempty))
    :effect (and
              (not (on ?b ?c))
              (clear ?c)
              (not (clear ?b))
              (not (handempty))
              (holding ?b))
  )

  ; PutDown: put the held block onto the table
  (:action PutDown
    :parameters (?b - block)
    :precondition (and
                    (holding ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b)))
  )

  ; Stack: put the held block onto a clear block
  (:action Stack
    :parameters (?b - block ?c - block)
    :precondition (and
                    (holding ?b)
                    (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (not (clear ?c))
              (handempty)
              (not (holding ?b)))
  )
)