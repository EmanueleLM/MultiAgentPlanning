(define (problem multiagent-empty-instance)
  (:domain multiagent-blocks)
  (:objects
    vowel_agent consonant_agent - agent
    table1 - table
    ;; No block objects are declared because no public or private block information was provided
  )
  (:init
    ;; Agents and their types (from reports)
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; Both agents start with empty hands (no blocks were provided)
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; The single table surface is clear (no blocks present)
    (clear table1)
  )
  ;; No global goal was provided in the reports; use a trivially satisfiable goal
  (:goal (and
    (handempty vowel_agent)
    (handempty consonant_agent)
  ))
)