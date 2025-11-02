(define (domain blocks-two-agents)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (vowel-block ?x - block)
    (consonant-block ?x - block)
  )

  ;; Vowel-agent actions: can only move blocks whose name starts with a vowel
  ;; Top-only and single-block moves enforced by preconditions (clear ?b) and
  ;; by having actions that move exactly one block at a time.

  (:action vowel-move-block-to-block
    :parameters (?b - block ?s - block ?d - block)
    :precondition (and
                    (vowel-block ?b)
                    (clear ?b)
                    (clear ?d)
                    (on ?b ?s)
                  )
    :effect (and
              (not (on ?b ?s))
              (on ?b ?d)
              ;; source becomes clear after removing ?b
              (clear ?s)
              ;; destination is no longer clear once ?b placed on it
              (not (clear ?d))
            )
  )

  (:action vowel-move-table-to-block
    :parameters (?b - block ?d - block)
    :precondition (and
                    (vowel-block ?b)
                    (clear ?b)
                    (clear ?d)
                    (on-table ?b)
                  )
    :effect (and
              (not (on-table ?b))
              (on ?b ?d)
              (not (clear ?d))
            )
  )

  (:action vowel-move-block-to-table
    :parameters (?b - block ?s - block)
    :precondition (and
                    (vowel-block ?b)
                    (clear ?b)
                    (on ?b ?s)
                  )
    :effect (and
              (not (on ?b ?s))
              (on-table ?b)
              ;; source becomes clear after removing ?b
              (clear ?s)
            )
  )

  ;; Consonant-agent actions: can only move blocks whose name starts with a consonant
  ;; Same top-only and single-block move constraints as for vowel agent.

  (:action consonant-move-block-to-block
    :parameters (?b - block ?s - block ?d - block)
    :precondition (and
                    (consonant-block ?b)
                    (clear ?b)
                    (clear ?d)
                    (on ?b ?s)
                  )
    :effect (and
              (not (on ?b ?s))
              (on ?b ?d)
              (clear ?s)
              (not (clear ?d))
            )
  )

  (:action consonant-move-table-to-block
    :parameters (?b - block ?d - block)
    :precondition (and
                    (consonant-block ?b)
                    (clear ?b)
                    (clear ?d)
                    (on-table ?b)
                  )
    :effect (and
              (not (on-table ?b))
              (on ?b ?d)
              (not (clear ?d))
            )
  )

  (:action consonant-move-block-to-table
    :parameters (?b - block ?s - block)
    :precondition (and
                    (consonant-block ?b)
                    (clear ?b)
                    (on ?b ?s)
                  )
    :effect (and
              (not (on ?b ?s))
              (on-table ?b)
              (clear ?s)
            )
  )

)