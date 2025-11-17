(define (domain orchestration_workflow)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent doc stage)

  (:predicates
    ;; stage progression (ordered stages as explicit objects)
    (succ ?s1 - stage ?s2 - stage)
    (stage_reached ?s - stage)

    ;; document/artifact availability
    (available ?d - doc)

    ;; final compiled artifacts (0-ary predicates)
    (compiled_domain)
    (compiled_problem)
  )

  ;; Orchestrator requests blocks, advancing workflow from s0 -> s1.
  (:action request_blocks_orchestrator
    :parameters ()
    :precondition (and (stage_reached s0) (not (stage_reached s1)))
    :effect (and (not (stage_reached s0)) (stage_reached s1))
  )

  ;; Environment posts the public information document after request (stage s1).
  (:action env_provide_public
    :parameters (?env_doc - doc)
    :precondition (and (stage_reached s1) (not (available ?env_doc)))
    :effect (and (available ?env_doc))
  )

  ;; Planner A posts its private information after request (stage s1).
  (:action plannera_provide_private
    :parameters (?pa_doc - doc)
    :precondition (and (stage_reached s1) (not (available ?pa_doc)))
    :effect (and (available ?pa_doc))
  )

  ;; Planner B posts its private information after request (stage s1).
  (:action plannerb_provide_private
    :parameters (?pb_doc - doc)
    :precondition (and (stage_reached s1) (not (available ?pb_doc)))
    :effect (and (available ?pb_doc))
  )

  ;; Planner A produces fragment A after both env public and its private doc are available.
  (:action produce_fragmenta_by_plannera
    :parameters (?pa_doc - doc ?env_doc - doc ?fragA_doc - doc)
    :precondition (and
      (stage_reached s1)
      (available ?pa_doc)
      (available ?env_doc)
      (not (available ?fragA_doc))
    )
    :effect (and (available ?fragA_doc))
  )

  ;; Planner B produces fragment B after both env public and its private doc are available.
  (:action produce_fragmentb_by_plannerb
    :parameters (?pb_doc - doc ?env_doc - doc ?fragB_doc - doc)
    :precondition (and
      (stage_reached s1)
      (available ?pb_doc)
      (available ?env_doc)
      (not (available ?fragB_doc))
    )
    :effect (and (available ?fragB_doc))
  )

  ;; Auditor audits both fragments and produces the cleaned fragment artifact,
  ;; advancing workflow from s1 -> s2. Requires both fragmentA and fragmentB.
  (:action auditor_audit
    :parameters (?fragA_doc - doc ?fragB_doc - doc ?clean_doc - doc)
    :precondition (and
      (stage_reached s1)
      (available ?fragA_doc)
      (available ?fragB_doc)
      (not (available ?clean_doc))
    )
    :effect (and
      (not (stage_reached s1))
      (stage_reached s2)
      (available ?clean_doc)
    )
  )

  ;; Orchestrator compiles the final domain/problem artifacts after cleaned fragments are available and stage s2 reached.
  (:action orchestrator_compile
    :parameters (?clean_doc - doc)
    :precondition (and
      (stage_reached s2)
      (available ?clean_doc)
      (not (compiled_domain))
      (not (compiled_problem))
    )
    :effect (and (compiled_domain) (compiled_problem))
  )
)