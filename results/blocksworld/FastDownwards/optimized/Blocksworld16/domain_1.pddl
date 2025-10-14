(define (domain blocks_multiagent)
  (:requirements :typing)
  (:types vowel consonant - block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (v-handempty)
    (c-handempty)
    (v-holding ?x - vowel)
    (c-holding ?x - consonant)
  )

  (:action vowel-pickup-from-table
    :parameters (?b - vowel)
    :precondition (and (ontable ?b) (clear ?b) (v-handempty))
    :effect (and (not (ontable ?b)) (not (clear ?b)) (not (v-handempty)) (v-holding ?b))
  )

  (:action vowel-pickup-from-block
    :parameters (?b - vowel ?below - block)
    :precondition (and (on ?b ?below) (clear ?b) (v-handempty))
    :effect (and (not (on ?b ?below)) (not (clear ?b)) (clear ?below) (not (v-handempty)) (v-holding ?b))
  )

  (:action vowel-putdown-on-table
    :parameters (?b - vowel)
    :precondition (v-holding ?b)
    :effect (and (not (v-holding ?b)) (ontable ?b) (clear ?b) (v-handempty))
  )

  (:action vowel-putdown-on-block
    :parameters (?b - vowel ?t - block)
    :precondition (and (v-holding ?b) (clear ?t))
    :effect (and (not (v-holding ?b)) (on ?b ?t) (not (clear ?t)) (clear ?b) (v-handempty))
  )

  (:action consonant-pickup-from-table
    :parameters (?b - consonant)
    :precondition (and (ontable ?b) (clear ?b) (c-handempty))
    :effect (and (not (ontable ?b)) (not (clear ?b)) (not (c-handempty)) (c-holding ?b))
  )

  (:action consonant-pickup-from-block
    :parameters (?b - consonant ?below - block)
    :precondition (and (on ?b ?below) (clear ?b) (c-handempty))
    :effect (and (not (on ?b ?below)) (not (clear ?b)) (clear ?below) (not (c-handempty)) (c-holding ?b))
  )

  (:action consonant-putdown-on-table
    :parameters (?b - consonant)
    :precondition (c-holding ?b)
    :effect (and (not (c-holding ?b)) (ontable ?b) (clear ?b) (c-handempty))
  )

  (:action consonant-putdown-on-block
    :parameters (?b - consonant ?t - block)
    :precondition (and (c-holding ?b) (clear ?t))
    :effect (and (not (c-holding ?b)) (on ?b ?t) (not (clear ?t)) (clear ?b) (c-handempty))
  )
)