(define (domain blocksworld-4blocks)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (handempty)
    )

    ; Pick up a block A: Hand empty, A on table, A clear. -> Holding A, A not on table, A not clear, hand not empty.
    (:action pickup
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (handempty))
        :effect (and (not (ontable ?x)) (not (clear ?x)) (not (handempty)) (holding ?x))
    )

    ; Put down a block A: Holding A. -> A on table, A clear, Hand empty, not holding A.
    (:action putdown
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (not (holding ?x)) (handempty) (ontable ?x) (clear ?x))
    )

    ; Stack A on B: Holding A, B is clear. -> A on B, A clear, Hand empty, B not clear, not holding A.
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (not (holding ?x)) (not (clear ?y)) (clear ?x) (handempty) (on ?x ?y))
    )

    ; Unstack A from B: Hand empty, A on B, A clear. -> Holding A, B clear, A not on B, hand not empty, A not clear.
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (handempty))
        :effect (and (holding ?x) (clear ?y) (not (clear ?x)) (not (handempty)) (not (on ?x ?y)))
    )