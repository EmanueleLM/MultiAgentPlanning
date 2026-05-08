(define (problem serve-children)
  (:domain prepare-and-serve-sandwiches)

  (:objects
    ; breads
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 - bread

    ; contents
    content1 content2 content3 content4 content5 content6 content7 content8 content9 - content

    ; sandwiches (placeholders sandw1..sandw12 exist but are initially not created)
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 - sandwich

    ; trays
    tray1 tray2 tray3 - tray

    ; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 - child

    ; places
    kitchen table1 table2 table3 - place
  )

  (:init
    ; bread and content availability
    (bread_available bread1) (bread_available bread2) (bread_available bread3)
    (bread_available bread4) (bread_available bread5) (bread_available bread6)
    (bread_available bread7) (bread_available bread8) (bread_available bread9)

    (content_available content1) (content_available content2) (content_available content3)
    (content_available content4) (content_available content5) (content_available content6)
    (content_available content7) (content_available content8) (content_available content9)

    ; gluten-free markings on raw components
    (bread_gluten_free bread2) (bread_gluten_free bread6) (bread_gluten_free bread7)
    (content_gluten_free content4) (content_gluten_free content5) (content_gluten_free content9)

    ; fixed recipe mapping (each sandwich uses exactly one bread and one content)
    (sandwich_bread sandw1 bread1)
    (sandwich_content sandw1 content1)

    (sandwich_bread sandw2 bread2)
    (sandwich_content sandw2 content4)

    (sandwich_bread sandw3 bread3)
    (sandwich_content sandw3 content2)

    (sandwich_bread sandw4 bread4)
    (sandwich_content sandw4 content3)

    (sandwich_bread sandw5 bread5)
    (sandwich_content sandw5 content6)

    (sandwich_bread sandw6 bread6)
    (sandwich_content sandw6 content5)

    (sandwich_bread sandw7 bread7)
    (sandwich_content sandw7 content9)

    (sandwich_bread sandw8 bread8)
    (sandwich_content sandw8 content7)

    (sandwich_bread sandw9 bread9)
    (sandwich_content sandw9 content8)

    ; recipes that require no-gluten make action (must be produced using make_sandwich_no_gluten)
    (recipe_requires_no_gluten sandw2)
    (recipe_requires_no_gluten sandw6)
    (recipe_requires_no_gluten sandw7)

    ; initial sandwich existence: none created yet
    ; (sandwich_exists ...) are not present for any sandwich at start

    ; trays initial location (all in kitchen)
    (tray_at tray1 kitchen)
    (tray_at tray2 kitchen)
    (tray_at tray3 kitchen)

    ; trays initially not loaded
    ; (tray_loaded ...) absent initially

    ; children waiting locations
    (child_waiting_at child1 table3)
    (child_waiting_at child2 table1)
    (child_waiting_at child3 table3)
    (child_waiting_at child4 table1)
    (child_waiting_at child5 table1)
    (child_waiting_at child6 table1)
    (child_waiting_at child7 table3)
    (child_waiting_at child8 table2)
    (child_waiting_at child9 table2)

    ; allergy flags (must be given gluten-free sandwiches)
    (child_allergic_to_gluten child9)
    (child_allergic_to_gluten child2)
    (child_allergic_to_gluten child3)

    ; Notes / enforced placement policy captured implicitly:
    ; The chef's initial intended tray placement is not encoded as forced initial state because sandwiches do not yet exist;
    ; the standard assembly and placement actions (make_* then put_on_tray) will be used to place sandwiches onto trays in kitchen.
    ; The server operational constraint "tray must be loaded before moving kitchen->table" is enforced by requiring tray_loaded for that move.
  )

  (:goal
    (and
      (served child1)
      (served child2)
      (served child3)
      (served child4)
      (served child5)
      (served child6)
      (served child7)
      (served child8)
      (served child9)
    )
  )
)