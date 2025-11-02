(define (domain multiagent-blocks)
  (:requirements :typing :negative-preconditions)
  (:types block vowel-block consonant-block)

  (:predicates
    (on ?x ?y - block)            ; ?x on top of ?y (both blocks)
    (ontable ?x - block)          ; ?x on the table
    (clear ?x - block)            ; nothing on top of ?x
    (holding-vowel ?x - vowel-block)
    (holding-consonant ?x - consonant-block)
    (vowel-handempty)
    (consonant-handempty)
  )

  ;; Vowel-agent actions (can only manipulate vowel blocks A,E,I,...)
  (:action vowel-pickup-from-table
    :parameters (?b - vowel-block)
    :precondition (and (ontable ?b) (clear ?b) (vowel-handempty))
    :effect (and (not (ontable ?b)) (not (clear ?b)) (holding-vowel ?b) (not (vowel-handempty)))
  )

  (:action vowel-pickup-from
    :parameters (?b - vowel-block ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (vowel-handempty))
    :effect (and (not (on ?b ?x)) (not (clear ?b)) (clear ?x) (holding-vowel ?b) (not (vowel-handempty)))
  )

  (:action vowel-putdown-on-table
    :parameters (?b - vowel-block)
    :precondition (and (holding-vowel ?b))
    :effect (and (ontable ?b) (clear ?b) (not (holding-vowel ?b)) (vowel-handempty))
  )

  (:action vowel-stack-on
    :parameters (?b - vowel-block ?x - block)
    :precondition (and (holding-vowel ?b) (clear ?x))
    :effect (and (on ?b ?x) (clear ?b) (not (clear ?x)) (not (holding-vowel ?b)) (vowel-handempty))
  )

  ;; Consonant-agent actions (can only manipulate consonant blocks B,C,D,...)
  (:action consonant-pickup-from-table
    :parameters (?b - consonant-block)
    :precondition (and (ontable ?b) (clear ?b) (consonant-handempty))
    :effect (and (not (ontable ?b)) (not (clear ?b)) (holding-consonant ?b) (not (consonant-handempty)))
  )

  (:action consonant-pickup-from
    :parameters (?b - consonant-block ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (consonant-handempty))
    :effect (and (not (on ?b ?x)) (not (clear ?b)) (clear ?x) (holding-consonant ?b) (not (consonant-handempty)))
  )

  (:action consonant-putdown-on-table
    :parameters (?b - consonant-block)
    :precondition (and (holding-consonant ?b))
    :effect (and (ontable ?b) (clear ?b) (not (holding-consonant ?b)) (consonant-handempty))
  )

  (:action consonant-stack-on
    :parameters (?b - consonant-block ?x - block)
    :precondition (and (holding-consonant ?b) (clear ?x))
    :effect (and (on ?b ?x) (clear ?b) (not (clear ?x)) (not (holding-consonant ?b)) (consonant-handempty))
  )
)