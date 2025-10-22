(define (domain BlocksworldScaling131)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table_spot - place)

  (:predicates
    (on ?b - block ?p - place)        ; block b is directly on place p (block or table_spot)
    (clear ?p - place)                ; place p has nothing on top of it
    (vowel ?b - block)                ; block is a vowel block (A, E, I)
    (consonant ?b - block)            ; block is a consonant block
  )

  ;; Vowel-agent moves (only vowel blocks)
  (:action move-vowel
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
                    (vowel ?b)
                    (on ?b ?from)
                    (clear ?b)
                    (clear ?to)
                    (not (= ?from ?to))
                    (not (= ?b ?to))
                  )
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Consonant-agent moves (only consonant blocks)
  (:action move-consonant
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
                    (consonant ?b)
                    (on ?b ?from)
                    (clear ?b)
                    (clear ?to)
                    (not (= ?from ?to))
                    (not (= ?b ?to))
                  )
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?b)
            )
  )
)