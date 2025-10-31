(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    block - place
    vowel consonant - block
  )

  (:predicates
    ;; a block (which is also a place) is directly on a place (either another block or a ground/table spot)
    (on ?b - block ?p - place)
    ;; a place (block or ground spot) has nothing directly stacked on it (is top)
    (clear ?p - place)
  )

  ;; Vowel-agent move: may move only vowels (A, I, E).
  ;; Moves only top blocks and only onto top-of-stack locations or ground/table spots.
  (:action vowel-agent-move
    :parameters (?b - vowel ?from - place ?to - place)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Consonant-agent move: may move only consonants.
  ;; Same structural restrictions as the vowel move, but restricted by type.
  (:action consonant-agent-move
    :parameters (?b - consonant ?from - place ?to - place)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)