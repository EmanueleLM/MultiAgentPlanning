(define (domain blocks-multiagent)
  (:requirements :strips :typing)
  (:types block agent slot)

  (:predicates
    (on ?b - block ?s - (either block slot))    ; block on block or on table slot
    (clear ?x - (either block slot))            ; top of a stack (block) or empty table slot
    (holding ?a - agent ?b - block)             ; agent holding a block
    (handempty ?a - agent)                      ; agent free to pick
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; V-agent actions (may touch only vowels; may pick only top vowel blocks)
  (:action pick-vagent-from-block
    :parameters (?b - block ?support - block)
    :precondition (and
                    (on ?b ?support)
                    (clear ?b)
                    (handempty v-agent)
                    (vowel ?b)
                  )
    :effect (and
              (not (on ?b ?support))
              (not (clear ?b))
              (not (handempty v-agent))
              (holding v-agent ?b)
              (clear ?support)
            )
  )

  (:action pick-vagent-from-slot
    :parameters (?b - block ?slot - slot)
    :precondition (and
                    (on ?b ?slot)
                    (clear ?b)
                    (handempty v-agent)
                    (vowel ?b)
                  )
    :effect (and
              (not (on ?b ?slot))
              (not (clear ?b))
              (not (handempty v-agent))
              (holding v-agent ?b)
              (clear ?slot)
            )
  )

  (:action put-vagent-on-block
    :parameters (?b - block ?target - block)
    :precondition (and
                    (holding v-agent ?b)
                    (clear ?target)
                  )
    :effect (and
              (not (holding v-agent ?b))
              (handempty v-agent)
              (on ?b ?target)
              (clear ?b)
              (not (clear ?target))
            )
  )

  (:action put-vagent-on-slot
    :parameters (?b - block ?slot - slot)
    :precondition (and
                    (holding v-agent ?b)
                    (clear ?slot)
                  )
    :effect (and
              (not (holding v-agent ?b))
              (handempty v-agent)
              (on ?b ?slot)
              (clear ?b)
              (not (clear ?slot))
            )
  )

  ;; C-agent actions (may touch only consonants; may pick only top consonant blocks)
  (:action pick-cagent-from-block
    :parameters (?b - block ?support - block)
    :precondition (and
                    (on ?b ?support)
                    (clear ?b)
                    (handempty c-agent)
                    (consonant ?b)
                  )
    :effect (and
              (not (on ?b ?support))
              (not (clear ?b))
              (not (handempty c-agent))
              (holding c-agent ?b)
              (clear ?support)
            )
  )

  (:action pick-cagent-from-slot
    :parameters (?b - block ?slot - slot)
    :precondition (and
                    (on ?b ?slot)
                    (clear ?b)
                    (handempty c-agent)
                    (consonant ?b)
                  )
    :effect (and
              (not (on ?b ?slot))
              (not (clear ?b))
              (not (handempty c-agent))
              (holding c-agent ?b)
              (clear ?slot)
            )
  )

  (:action put-cagent-on-block
    :parameters (?b - block ?target - block)
    :precondition (and
                    (holding c-agent ?b)
                    (clear ?target)
                  )
    :effect (and
              (not (holding c-agent ?b))
              (handempty c-agent)
              (on ?b ?target)
              (clear ?b)
              (not (clear ?target))
            )
  )

  (:action put-cagent-on-slot
    :parameters (?b - block ?slot - slot)
    :precondition (and
                    (holding c-agent ?b)
                    (clear ?slot)
                  )
    :effect (and
              (not (holding c-agent ?b))
              (handempty c-agent)
              (on ?b ?slot)
              (clear ?b)
              (not (clear ?slot))
            )
  )
)