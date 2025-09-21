(define (domain multi-agent-blocks)
  (:requirements :strips :equality)
  (:predicates
    (on ?x ?y)
    (ontable ?x)
    (clear ?x)
    (vowel ?x)
    (consonant ?x)
    (holding ?x)
    (handempty)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; VOWEL agent actions (vowel-only manipulations)
  ;; Namespaced with "vowel-" prefix to keep actions distinct.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Move a vowel block from one block to another block
  (:action vowel-move-vowel-block-to-block
    :parameters (?b ?from ?to)
    :precondition (and
                    (vowel ?b)
                    (on ?b ?from)
                    (clear ?b)
                    (clear ?to)
                    (not (= ?b ?to))
                  )
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  ;; Move a vowel block from the table onto another block
  (:action vowel-move-vowel-table-to-block
    :parameters (?b ?to)
    :precondition (and
                    (vowel ?b)
                    (ontable ?b)
                    (clear ?b)
                    (clear ?to)
                  )
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  ;; Move a vowel block from on top of another block onto the table
  (:action vowel-move-vowel-block-to-table
    :parameters (?b ?from)
    :precondition (and
                    (vowel ?b)
                    (on ?b ?from)
                    (clear ?b)
                  )
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; CONSONANT agent actions (consonant-only manipulations)
  ;; Namespaced with "consonant-" prefix to keep actions distinct.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Pick a consonant block from the table (only if it's clear and hand is empty)
  (:action consonant-pick-up
    :parameters (?b)
    :precondition (and (ontable ?b) (clear ?b) (handempty) (consonant ?b))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  ;; Unstack a consonant block from another block (only if it's clear and hand empty)
  (:action consonant-unstack
    :parameters (?b ?c)
    :precondition (and (on ?b ?c) (clear ?b) (handempty) (consonant ?b))
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
    )
  )

  ;; Put down (place on table) a consonant block being held
  (:action consonant-putdown
    :parameters (?b)
    :precondition (and (holding ?b) (consonant ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Stack a consonant block being held onto another block (target must be clear)
  (:action consonant-stack
    :parameters (?b ?c)
    :precondition (and (holding ?b) (clear ?c) (consonant ?b))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?c))
    )
  )
)