(define (domain blocksworld)
  :requirements :strips :typing :negative-preconditions
  :types block
  :predicates
    (handempty)
    (holding ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
    (block ?b - block)
  ;; Pick up a block from the table
  (:action pickup
    :parameters (?b - block)
    :precondition (and
                   (block ?b)
                   (ontable ?b)
                   (clear ?b)
                   (handempty))
    :effect (and
             (not (ontable ?b))
             (not (clear ?b))
             (not (handempty))
             (holding ?b)))
  ;; Unstack a block from another block
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and
                   (block ?b)
                   (block ?c)
                   (on ?b ?c)
                   (clear ?b)
                   (handempty))
    :effect (and
             (not (on ?b ?c))
             (not (clear ?b))
             (not (handempty))
             (holding ?b)
             (clear ?c)))
  ;; Put the held block down onto the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and
                   (block ?b)
                   (holding ?b))
    :effect (and
             (ontable ?b)
             (clear ?b)
             (handempty)
             (not (holding ?b))))
  ;; Stack the held block onto another block
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and
                   (block ?b)
                   (block ?c)
                   (holding ?b)
                   (clear ?c))
    :effect (and
             (on ?b ?c)
             (clear ?b)
             (handempty)
             (not (holding ?b))
             (not (clear ?c))))
)