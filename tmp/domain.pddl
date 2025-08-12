(define (domain dual-agent-block-world)
  (:requirements :typing :strips)

  (:types block)

  (:predicates
    (on          ?b1 ?b2 - block)
    (on-table    ?b - block)
    (clear       ?b - block)
    (vowel       ?b - block)
    (consonant   ?b - block)
    (hand-empty-a)
    (holding-a   ?b - block)
    (hand-empty-b)
    (holding-b   ?b - block)
  )

  (:action pick-up-a
    :parameters (?b - block)
    :precondition (and
                    (hand-empty-a)
                    (on-table ?b)
                    (clear ?b)
                    (vowel ?b)
                    (not (holding-b ?b)))
    :effect (and
              (not (hand-empty-a))
              (not (on-table ?b))
              (not (clear ?b))
              (holding-a ?b))) 

  (:action unstack-a
    :parameters (?b ?b2 - block)
    :precondition (and
                    (hand-empty-a)
                    (on ?b ?b2)
                    (clear ?b)
                    (vowel ?b)
                    (not (holding-b ?b)))
    :effect (and
              (not (hand-empty-a))
              (not (on ?b ?b2))
              (clear ?b2)
              (holding-a ?b)
              (not (clear ?b))) )

  (:action put-down-a
    :parameters (?b - block)
    :precondition (and
                    (holding-a ?b)
                    (vowel ?b))
    :effect (and
              (hand-empty-a)
              (not (holding-a ?b))
              (on-table ?b)
              (clear ?b))) 

  (:action stack-a
    :parameters (?b ?s - block)
    :precondition (and
                    (holding-a ?b)
                    (clear ?s)
                    (vowel ?b)
                    (not (holding-b ?b)))
    :effect (and
              (hand-empty-a)
              (not (holding-a ?b))
              (on ?b ?s)
              (clear ?b)
              (not (clear ?s))) )

  (:action pick-up-b
    :parameters (?b - block)
    :precondition (and
                    (hand-empty-b)
                    (on-table ?b)
                    (clear ?b)
                    (consonant ?b)
                    (not (holding-a ?b)))
    :effect (and
              (not (hand-empty-b))
              (not (on-table ?b))
              (not (clear ?b))
              (holding-b ?b))) 

  (:action unstack-b
    :parameters (?b ?b2 - block)
    :precondition (and
                    (hand-empty-b)
                    (on ?b ?b2)
                    (clear ?b)
                    (consonant ?b)
                    (not (holding-a ?b)))
    :effect (and
              (not (hand-empty-b))
              (not (on ?b ?b2))
              (clear ?b2)
              (holding-b ?b)
              (not (clear ?b))) )

  (:action put-down-b
    :parameters (?b - block)
    :precondition (and
                    (holding-b ?b)
                    (consonant ?b))
    :effect (and
              (hand-empty-b)
              (not (holding-b ?b))
              (on-table ?b)
              (clear ?b))) 

  (:action stack-b
    :parameters (?b ?s - block)
    :precondition (and
                    (holding-b ?b)
                    (clear ?s)
                    (consonant ?b)
                    (not (holding-a ?b)))
    :effect (and
              (hand-empty-b)
              (not (holding-b ?b))
              (on ?b ?s)
              (clear ?b)
              (not (clear ?s))) )
)