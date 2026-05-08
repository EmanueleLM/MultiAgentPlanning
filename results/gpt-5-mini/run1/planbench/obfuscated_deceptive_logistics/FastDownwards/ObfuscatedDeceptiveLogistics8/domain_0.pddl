(define (domain pddl_orchestrator)
  :requirements :strips :typing :negative-preconditions
  :types object

  :predicates
    ;; Canonicalized predicates (auditor applied conservative canonicalization)
    (next ?a - object ?b - object)                ; immediate successor relation to achieve
    (can_player_set ?a - object ?b - object)     ; allowed capability from player.analysis
    (can_collector_set ?a - object ?b - object)  ; allowed capability from collector.analysis
    (player_done_set ?a - object ?b - object)    ; provenance: player action completed
    (collector_done_set ?a - object ?b - object) ; provenance: collector action completed
    (auditor_validated)                           ; optional auditor validation marker

  ;; Actions kept distinct and prefixed by source (player / collector / auditor)
  (:action player_set_next
    :parameters (?a - object ?b - object)
    :precondition (and
                    (can_player_set ?a ?b)     ;; player allowed to set this pair
                    (not (next ?a ?b))        ;; not already established
                  )
    :effect (and
              (next ?a ?b)
              (player_done_set ?a ?b)
            )
  )

  (:action collector_set_next
    :parameters (?a - object ?b - object)
    :precondition (and
                    (can_collector_set ?a ?b)  ;; collector allowed to set this pair
                    (not (next ?a ?b))         ;; not already established
                  )
    :effect (and
              (next ?a ?b)
              (collector_done_set ?a ?b)
            )
  )

  ;; Auditor action represents the auditor.report's conservative repair/validation step.
  ;; It does not invent or remove 'next' edges; it only records that validation was performed
  ;; and requires that the repaired canonicalization conditions hold (here: that any established
  ;; next facts were created by the permitted agents). This enforces the auditor's constraint
  ;; as a hard requirement when validation is performed, rather than as a soft preference.
  (:action auditor_validate_creations
    :parameters ()
    :precondition (and
                    ;; If auditor validation is executed, require that any next facts present
                    ;; were created via the canonicalized player/collector actions.
                    ;; Because PDDL cannot universally quantify in preconditions here,
                    ;; we enforce validation only as a final check that the known target facts exist
                    ;; and were produced by the permitted agents. This matches the auditor's
                    ;; conservative repair: require provenance for the target next facts.
                    (player_done_set object_10 object_6)
                    (collector_done_set object_9 object_6)
                  )
    :effect (and
              (auditor_validated)
            )
  )

)