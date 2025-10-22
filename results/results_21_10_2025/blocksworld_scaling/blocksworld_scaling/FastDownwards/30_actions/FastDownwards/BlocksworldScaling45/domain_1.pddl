(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block place support)
  (:predicates
    ;; block on a support (support is either a block or a place)
    (on ?b - block ?s - support)
    ;; the support is currently top (i.e., nothing sits on it)
    (top ?s - support)
    ;; label predicates to restrict agent capabilities
    (vowel ?b - block)
    (consonant ?b - block)
    ;; immobile: cannot be moved by any agent (conservative assumption)
    (immobile ?b - block)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Vowel-agent move: moves a vowel block that is currently top of its
  ;; support, placing it onto a destination support that is currently top.
  ;; The block must not be immobile.
  (:action move-vowel
    :parameters (?b - block ?from - support ?to - support)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (top ?b)
      (top ?to)
      (not (immobile ?b))
      ;; cannot move onto itself
      (not (= ?b ?to))
    )
    :effect (and
      ;; detach from the previous support
      (not (on ?b ?from))
      ;; attach onto the destination support
      (on ?b ?to)
      ;; after removal, the former support becomes top
      (top ?from)
      ;; the destination is no longer top because ?b sits on it
      (not (top ?to))
      ;; the moved block is now top
      (top ?b)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Consonant-agent move: analogous to vowel move but restricted to consonants.
  (:action move-consonant
    :parameters (?b - block ?from - support ?to - support)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (top ?b)
      (top ?to)
      (not (immobile ?b))
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (top ?from)
      (not (top ?to))
      (top ?b)
    )
  )
)