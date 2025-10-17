import streamlit as st
from backend.crud import add_faculty, list_faculty

def run():
    st.header("Faculty Profile Management")
    with st.form("add_faculty"):
        name = st.text_input("Name")
        dept = st.text_input("Department")
        designation = st.text_input("Designation")
        qualification = st.text_input("Qualification")
        experience = st.number_input("Experience (years)", min_value=0)
        email = st.text_input("Email")
        phone = st.text_input("Phone")
        submitted = st.form_submit_button("Add Faculty")
        if submitted:
            add_faculty({
                "name": name, "dept": dept, "designation": designation,
                "qualification": qualification, "experience": experience, "email": email, "phone": phone
            })
            st.success("Faculty added")

    st.subheader("All Faculty")
    rows = list_faculty()
    st.dataframe(rows)
