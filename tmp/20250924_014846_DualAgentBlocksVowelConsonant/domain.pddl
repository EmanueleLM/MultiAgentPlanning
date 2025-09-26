(define (domain dual-agent-blocks)
  (:requirements :strips :typing :negative-preconditions :equality :conditional-effects)
  (:types block stack)
  (:predicates
    (vowel ?b - block)
    (consonant ?b - block)
    (ontable ?b - block ?s - stack)
    (on ?b - block ?under - block)
    (clear ?b - block)
    (bottom ?b - block ?s - stack)
    (stack-used ?s - stack)
    (stack-free ?s - stack)
    (handempty-va)
    (handempty-ca)
    (holding-va ?b - block)
    (holding-ca ?b - block)
  )

  (:action pick-table-va
    :parameters (?b - block ?s - stack)
    :precondition (and (vowel ?b) (ontable ?b ?s) (clear ?b) (handempty-va))
    :effect (and
              (not (ontable ?b ?s))
              (not (handempty-va))
              (holding-va ?b)
              (not (clear ?b))
              (when (bottom ?b ?s)
                (and
                  (not (bottom ?b ?s))
                  (not (stack-used ?s))
                  (stack-free ?s)
                )
              )
            )
  )

  (:action pick-block-va
    :parameters (?b - block ?under - block)
    :precondition (and (vowel ?b) (on ?b ?under) (clear ?b) (handempty-va))
    :effect (and
              (not (on ?b ?under))
              (not (handempty-va))
              (holding-va ?b)
              (not (clear ?b))
              (clear ?under)
            )
  )

  (:action pick-table-ca
    :parameters (?b - block ?s - stack)
    :precondition (and (consonant ?b) (ontable ?b ?s) (clear ?b) (handempty-ca))
    :effect (and
              (not (ontable ?b ?s))
              (not (handempty-ca))
              (holding-ca ?b)
              (not (clear ?b))
              (when (bottom ?b ?s)
                (and
                  (not (bottom ?b ?s))
                  (not (stack-used ?s))
                  (stack-free ?s)
                )
              )
            )
  )

  (:action pick-block-ca
    :parameters (?b - block ?under - block)
    :precondition (and (consonant ?b) (on ?b ?under) (clear ?b) (handempty-ca))
    :effect (and
              (not (on ?b ?under))
              (not (handempty-ca))
              (holding-ca ?b)
              (not (clear ?b))
              (clear ?under)
            )
  )

  (:action place-on-block-va
    :parameters (?b - block ?t - block)
    :precondition (and (vowel ?b) (holding-va ?b) (clear ?t) (not (holding-ca ?t)))
    :effect (and
              (not (holding-va ?b))
              (on ?b ?t)
              (not (clear ?t))
              (clear ?b)
              (handempty-va)
            )
  )

  (:action place-on-table-va
    :parameters (?b - block ?s - stack)
    :precondition (and (vowel ?b) (holding-va ?b) (stack-free ?s))
    :effect (and
              (not (holding-va ?b))
              (ontable ?b ?s)
              (bottom ?b ?s)
              (not (stack-free ?s))
              (stack-used ?s)
              (clear ?b)
              (handempty-va)
            )
  )

  (:action place-on-block-ca
    :parameters (?b - block ?t - block)
    :precondition (and (consonant ?b) (holding-ca ?b) (clear ?t) (not (holding-va ?t)))
    :effect (and
              (not (holding-ca ?b))
              (on ?b ?t)
              (not (clear ?t))
              (clear ?b)
              (handempty-ca)
            )
  )

  (:action place-on-table-ca
    :parameters (?b - block ?s - stack)
    :precondition (and (consonant ?b) (holding-ca ?b) (stack-free ?s))
    :effect (and
              (not (holding-ca ?b))
              (ontable ?b ?s)
              (bottom ?b ?s)
              (not (stack-free ?s))
              (stack-used ?s)
              (clear ?b)
              (handempty-ca)
            )
  )
)