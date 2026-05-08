(define (problem sandwich_problem_serve10)
  (:domain sandwich_domain)

  (:objects
    ; places
    kitchen table1 table2 table3 table4 table5 table6 table7 table8 table9 table10 - place

    ; trays
    tray1 tray2 tray3 - tray

    ; slots: 3 trays x 4 slots each = 12 slots
    slot_t1_1 slot_t1_2 slot_t1_3 slot_t1_4
    slot_t2_1 slot_t2_2 slot_t2_3 slot_t2_4
    slot_t3_1 slot_t3_2 slot_t3_3 slot_t3_4 - slot

    ; breads and contents (10 each)
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 - bread_portion
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 - content_portion

    ; sandwiches placeholders (13 available identifiers)
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 - sandwich

    ; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 - child
  )

  ; initial facts
  (:init
    ; All bread and content items are available and located in kitchen
    (bread_available bread1) (at bread1 kitchen)
    (bread_available bread2) (at bread2 kitchen)
    (bread_available bread3) (at bread3 kitchen)
    (bread_available bread4) (at bread4 kitchen)
    (bread_available bread5) (at bread5 kitchen)
    (bread_available bread6) (at bread6 kitchen)
    (bread_available bread7) (at bread7 kitchen)
    (bread_available bread8) (at bread8 kitchen)
    (bread_available bread9) (at bread9 kitchen)
    (bread_available bread10) (at bread10 kitchen)

    (content_available content1) (at content1 kitchen)
    (content_available content2) (at content2 kitchen)
    (content_available content3) (at content3 kitchen)
    (content_available content4) (at content4 kitchen)
    (content_available content5) (at content5 kitchen)
    (content_available content6) (at content6 kitchen)
    (content_available content7) (at content7 kitchen)
    (content_available content8) (at content8 kitchen)
    (content_available content9) (at content9 kitchen)
    (content_available content10) (at content10 kitchen)

    ; Mark which breads and contents are gluten-free.
    ; We provide four gluten-free bread portions and four gluten-free content portions
    (bread_gluten_free bread1)
    (bread_gluten_free bread2)
    (bread_gluten_free bread3)
    (bread_gluten_free bread4)

    (content_gluten_free content1)
    (content_gluten_free content2)
    (content_gluten_free content3)
    (content_gluten_free content4)

    ; Place trays in kitchen
    (tray_at tray1 kitchen)
    (tray_at tray2 kitchen)
    (tray_at tray3 kitchen)

    ; Define slots belonging to each tray and mark them free initially
    (slot_of slot_t1_1 tray1) (slot_free slot_t1_1)
    (slot_of slot_t1_2 tray1) (slot_free slot_t1_2)
    (slot_of slot_t1_3 tray1) (slot_free slot_t1_3)
    (slot_of slot_t1_4 tray1) (slot_free slot_t1_4)

    (slot_of slot_t2_1 tray2) (slot_free slot_t2_1)
    (slot_of slot_t2_2 tray2) (slot_free slot_t2_2)
    (slot_of slot_t2_3 tray2) (slot_free slot_t2_3)
    (slot_of slot_t2_4 tray2) (slot_free slot_t2_4)

    (slot_of slot_t3_1 tray3) (slot_free slot_t3_1)
    (slot_of slot_t3_2 tray3) (slot_free slot_t3_2)
    (slot_of slot_t3_3 tray3) (slot_free slot_t3_3)
    (slot_of slot_t3_4 tray3) (slot_free slot_t3_4)

    ; Place children at tables; each child at their own table
    (child_at child1 table1)
    (child_at child2 table2)
    (child_at child3 table3)
    (child_at child4 table4)
    (child_at child5 table5)
    (child_at child6 table6)
    (child_at child7 table7)
    (child_at child8 table8)
    (child_at child9 table9)
    (child_at child10 table10)

    ; Some children are gluten-allergic. We mark four allergic children.
    (child_allergic_gluten child1)
    (child_allergic_gluten child3)
    (child_allergic_gluten child5)
    (child_allergic_gluten child7)

    ; All sandwich identifiers are available as placeholders initially (13 placeholders)
    (placeholder_available s1) (placeholder_available s2) (placeholder_available s3)
    (placeholder_available s4) (placeholder_available s5) (placeholder_available s6)
    (placeholder_available s7) (placeholder_available s8) (placeholder_available s9)
    (placeholder_available s10) (placeholder_available s11) (placeholder_available s12)
    (placeholder_available s13)

    ; No sandwiches exist nor consumed at the start (no sandwich_exists / sandwich_consumed facts)
    ; No sandwich_on_tray facts initially
    ; No served_with / child_served facts initially

  )

  ; Goal: every child child1..child10 must be served an acceptable sandwich
  (:goal (and
    (child_served child1)
    (child_served child2)
    (child_served child3)
    (child_served child4)
    (child_served child5)
    (child_served child6)
    (child_served child7)
    (child_served child8)
    (child_served child9)
    (child_served child10)
  ))
)