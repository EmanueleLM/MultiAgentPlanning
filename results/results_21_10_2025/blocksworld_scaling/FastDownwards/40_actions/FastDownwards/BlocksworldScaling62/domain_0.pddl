(define (domain blocks-two-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?x - block)         ; ?b is on ?x ; TABLE is a special block constant for the table
    (clear ?b - block)                 ; nothing on top of ?b (for TABLE, we keep it true and do not modify it)
    (is-vowel ?b - block)
    (is-consonant ?b - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )

  ;; -----------------------
  ;; VOWEL-AGENT ACTIONS
  ;; Vowel agent may move only blocks marked is-vowel.
  ;; We separate variants so moves involving TABLE don't require TABLE to be "clear" or to be updated.
  ;; We also forbid specific placements of E as a hard constraint (never place E on A, B or J).
  ;; -----------------------

  ;; move a vowel (except E) from a non-TABLE block to a non-TABLE block
  (:action move-vowel-block-to-block
    :parameters (?a - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (vowel-agent ?a)
      (is-vowel ?b)
      (not (= ?b E))                ; this action schema excludes E (E has its own actions with target restrictions)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from TABLE))
      (not (= ?to TABLE))
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; move a vowel (except E) from TABLE to non-TABLE block
  (:action move-vowel-table-to-block
    :parameters (?a - agent ?b - block ?to - block)
    :precondition (and
      (vowel-agent ?a)
      (is-vowel ?b)
      (not (= ?b E))
      (on ?b TABLE)
      (clear ?b)
      (clear ?to)
      (not (= ?to TABLE))
    )
    :effect (and
      (not (on ?b TABLE))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; move a vowel (except E) from a non-TABLE block onto TABLE
  (:action move-vowel-block-to-table
    :parameters (?a - agent ?b - block ?from - block)
    :precondition (and
      (vowel-agent ?a)
      (is-vowel ?b)
      (not (= ?b E))
      (on ?b ?from)
      (clear ?b)
      (not (= ?from TABLE))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b TABLE)
      (clear ?from)
    )
  )

  ;; -----------------------
  ;; E-specific vowel actions (E may be moved, but forbidden targets: A, B, J)
  ;; -----------------------
  (:action move-E-block-to-block
    :parameters (?a - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (vowel-agent ?a)
      (is-vowel ?b)
      (= ?b E)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from TABLE))
      (not (= ?to TABLE))
      (not (= ?to A))   ; hard constraint: E must never be placed on A
      (not (= ?to B))   ; hard constraint: E must never be placed on B
      (not (= ?to J))   ; hard constraint: E must never be placed on J
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-E-table-to-block
    :parameters (?a - agent ?b - block ?to - block)
    :precondition (and
      (vowel-agent ?a)
      (is-vowel ?b)
      (= ?b E)
      (on ?b TABLE)
      (clear ?b)
      (clear ?to)
      (not (= ?to TABLE))
      (not (= ?to A))
      (not (= ?to B))
      (not (= ?to J))
    )
    :effect (and
      (not (on ?b TABLE))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action move-E-block-to-table
    :parameters (?a - agent ?b - block ?from - block)
    :precondition (and
      (vowel-agent ?a)
      (is-vowel ?b)
      (= ?b E)
      (on ?b ?from)
      (clear ?b)
      (not (= ?from TABLE))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b TABLE)
      (clear ?from)
    )
  )

  ;; -----------------------
  ;; CONSONANT-AGENT ACTIONS
  ;; Consonant agent may move only is-consonant blocks.
  ;; We prevent moving B using the general consonant actions; moving B is allowed only via special actions that require A-on-B.
  ;; -----------------------

  ;; move a consonant that is NOT B from block to block
  (:action move-consonant-block-to-block
    :parameters (?a - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (consonant-agent ?a)
      (is-consonant ?b)
      (not (= ?b B))             ; general consonant actions exclude B
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from TABLE))
      (not (= ?to TABLE))
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; move a consonant (not B) from TABLE to block
  (:action move-consonant-table-to-block
    :parameters (?a - agent ?b - block ?to - block)
    :precondition (and
      (consonant-agent ?a)
      (is-consonant ?b)
      (not (= ?b B))
      (on ?b TABLE)
      (clear ?b)
      (clear ?to)
      (not (= ?to TABLE))
    )
    :effect (and
      (not (on ?b TABLE))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; move a consonant (not B) from block to TABLE
  (:action move-consonant-block-to-table
    :parameters (?a - agent ?b - block ?from - block)
    :precondition (and
      (consonant-agent ?a)
      (is-consonant ?b)
      (not (= ?b B))
      (on ?b ?from)
      (clear ?b)
      (not (= ?from TABLE))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b TABLE)
      (clear ?from)
    )
  )

  ;; -----------------------
  ;; SPECIAL: moving B (consonant) is allowed only after A is on B
  ;; We provide separate actions for B that require (on A B) as a precondition.
  ;; -----------------------

  (:action move-B-block-to-block
    :parameters (?a - agent ?from - block ?to - block)
    :precondition (and
      (consonant-agent ?a)
      (is-consonant B)
      (on B ?from)
      (clear B)
      (clear ?to)
      (not (= ?from TABLE))
      (not (= ?to TABLE))
      (not (= ?from ?to))
      (on A B)                    ; hard constraint: B may be moved only after A is on B
    )
    :effect (and
      (not (on B ?from))
      (on B ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-B-table-to-block
    :parameters (?a - agent ?to - block)
    :precondition (and
      (consonant-agent ?a)
      (is-consonant B)
      (on B TABLE)
      (clear B)
      (clear ?to)
      (not (= ?to TABLE))
      (on A B)
    )
    :effect (and
      (not (on B TABLE))
      (on B ?to)
      (not (clear ?to))
    )
  )

  (:action move-B-block-to-table
    :parameters (?a - agent ?from - block)
    :precondition (and
      (consonant-agent ?a)
      (is-consonant B)
      (on B ?from)
      (clear B)
      (not (= ?from TABLE))
      (on A B)
    )
    :effect (and
      (not (on B ?from))
      (on B TABLE)
      (clear ?from)
    )
  )

)