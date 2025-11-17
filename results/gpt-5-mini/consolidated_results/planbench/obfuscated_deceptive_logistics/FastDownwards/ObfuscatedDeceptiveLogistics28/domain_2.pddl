(define (domain orchestration_workflow)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent doc stage)

  (:predicates
    ;; stage progression
    (stage_reached ?s - stage)
    (succ ?s1 - stage ?s2 - stage)

    ;; documents and artifacts
    (available ?d - doc)
    (fragmentA_ready ?d - doc)
    (fragmentB_ready ?d - doc)
    (clean_fragments_ready ?d - doc)

    ;; final compiled artifacts
    (compiled_domain)
    (compiled_problem)
  )

  ;; Orchestrator requests blocks, advancing workflow from stage s0 -> s1.
  (:action request_blocks_orchestrator
    :parameters ()
    :precondition (and (stage_reached s0) (not (stage_reached s1)))
    :effect (and (stage_reached s1))
  )

  ;; Environment posts the public information document after request (stage s1).
  (:action env_provide_public
    :parameters (?env_doc - doc)
    :precondition (and (stage_reached s1) (not (available ?env_doc)))
    :effect (and (available ?env_doc))
  )

  ;; Planner A posts its private information after request (stage s1).
  (:action plannerA_provide_private
    :parameters (?pa_doc - doc)
    :precondition (and (stage_reached s1) (not (available ?pa_doc)))
    :effect (and (available ?pa_doc))
  )

  ;; Planner B posts its private information after request (stage s1).
  (:action plannerB_provide_private
    :parameters (?pb_doc - doc)
    :precondition (and (stage_reached s1) (not (available ?pb_doc)))
    :effect (and (available ?pb_doc))
  )

  ;; Planner A produces fragment A after both env public and its private doc are available.
  (:action produce_fragmentA_by_plannerA
    :parameters (?pa_doc - doc ?env_doc - doc ?fragA_doc - doc)
    :precondition (and (stage_reached s1) (available ?pa_doc) (available ?env_doc) (not (fragmentA_ready ?fragA_doc)))
    :effect (and (fragmentA_ready ?fragA_doc))
  )

  ;; Planner B produces fragment B after both env public and its private doc are available.
  (:action produce_fragmentB_by_plannerB
    :parameters (?pb_doc - doc ?env_doc - doc ?fragB_doc - doc)
    :precondition (and (stage_reached s1) (available ?pb_doc) (available ?env_doc) (not (fragmentB_ready ?fragB_doc)))
    :effect (and (fragmentB_ready ?fragB_doc))
  )

  ;; Auditor audits both fragments and produces the cleaned fragment artifact,
  ;; advancing workflow from stage s1 -> s2. Requires both fragmentA and fragmentB.
  (:action auditor_audit
    :parameters (?fragA_doc - doc ?fragB_doc - doc ?clean_doc - doc)
    :precondition (and (stage_reached s1) (fragmentA_ready ?fragA_doc) (fragmentB_ready ?fragB_doc) (not (clean_fragments_ready ?clean_doc)))
    :effect (and (clean_fragments_ready ?clean_doc) (stage_reached s2))
  )

  ;; Orchestrator compiles the final domain/problem artifacts after cleaned fragments are available and stage s2 reached.
  (:action orchestrator_compile
    :parameters (?clean_doc - doc)
    :precondition (and (stage_reached s2) (clean_fragments_ready ?clean_doc) (not (compiled_domain)) (not (compiled_problem)))
    :effect (and (compiled_domain) (compiled_problem))
  )
)