(define (domain blocksworld-scaling89)
  (:requirements :strips :typing :negative-preconditions)
  (:types vowel consonant - block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty-vowel)
    (handempty-cons)
    (holding-vowel ?x - vowel)
    (holding-cons ?x - consonant)
  )

  ;; Vowel agent picks a vowel from on top of another block
  (:action vowel-pick-from-block
    :parameters (?b - vowel ?s - block)
    :precondition (and (handempty-vowel) (clear ?b) (on ?b ?s))
    :effect (and
              (not (on ?b ?s))
              (not (handempty-vowel))
              (holding-vowel ?b)
              (clear ?s)
              (not (clear ?b))
            )
  )

  ;; Vowel agent picks a vowel from the table
  (:action vowel-pick-from-table
    :parameters (?b - vowel)
    :precondition (and (handempty-vowel) (clear ?b) (ontable ?b))
    :effect (and
              (not (ontable ?b))
              (not (handempty-vowel))
              (holding-vowel ?b)
              (not (clear ?b))
            )
  )

  ;; Vowel agent places a held vowel onto a block
  (:action vowel-place-on-block
    :parameters (?b - vowel ?t - block)
    :precondition (and (holding-vowel ?b) (clear ?t))
    :effect (and
              (not (holding-vowel ?b))
              (handempty-vowel)
              (on ?b ?t)
              (not (clear ?t))
              (clear ?b)
            )
  )

  ;; Vowel agent places a held vowel onto the table
  (:action vowel-place-on-table
    :parameters (?b - vowel)
    :precondition (holding-vowel ?b)
    :effect (and
              (not (holding-vowel ?b))
              (handempty-vowel)
              (ontable ?b)
              (clear ?b)
            )
  )

  ;; Consonant agent picks a consonant from on top of another block
  (:action cons-pick-from-block
    :parameters (?b - consonant ?s - block)
    :precondition (and (handempty-cons) (clear ?b) (on ?b ?s))
    :effect (and
              (not (on ?b ?s))
              (not (handempty-cons))
              (holding-cons ?b)
              (clear ?s)
              (not (clear ?b))
            )
  )

  ;; Consonant agent picks a consonant from the table
  (:action cons-pick-from-table
    :parameters (?b - consonant)
    :precondition (and (handempty-cons) (clear ?b) (ontable ?b))
    :effect (and
              (not (ontable ?b))
              (not (handempty-cons))
              (holding-cons ?b)
              (not (clear ?b))
            )
  )

  ;; Consonant agent places a held consonant onto a block
  (:action cons-place-on-block
    :parameters (?b - consonant ?t - block)
    :precondition (and (holding-cons ?b) (clear ?t))
    :effect (and
              (not (holding-cons ?b))
              (handempty-cons)
              (on ?b ?t)
              (not (clear ?t))
              (clear ?b)
            )
  )

  ;; Consonant agent places a held consonant onto the table
  (:action cons-place-on-table
    :parameters (?b - consonant)
    :precondition (holding-cons ?b)
    :effect (and
              (not (holding-cons ?b))
              (handempty-cons)
              (ontable ?b)
              (clear ?b)
            )
  )
)