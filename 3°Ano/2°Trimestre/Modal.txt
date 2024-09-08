import React, { useState } from 'react';
import { View, Text, TextInput, Pressable, StyleSheet, Image, Modal } from 'react-native';

const Santoandre = () => {
    const [saldo, setSaldo] = useState(7320.92);
    const [valor, setValor] = useState('');
    const [showModal, setShowModal] = useState(false);
    const [modalMessage, setModalMessage] = useState('');
    const [actionType, setActionType] = useState('');

    const openConfirmationModal = (type) => {
        setActionType(type);
        if (type === 'deposito') {
            setModalMessage('Você está prestes a depositar. A taxa é de 1%. Continuar?');
        } else if (type === 'sacar') {
            setModalMessage('Você está prestes a sacar. A taxa é de 2.5%. Continuar?');
        }
        setShowModal(true);
    };

    const handleConfirm = () => {
        if (actionType === 'deposito') {
            deposito();
        } else if (actionType === 'sacar') {
            sacar();
        }
        setShowModal(false);
    };

    const deposito = () => {
        const valorNumerico = parseFloat(valor);
        if (!isNaN(valorNumerico) && valorNumerico > 0) {
            const novoSaldo = saldo + valorNumerico + valorNumerico * 0.01;
            setSaldo(novoSaldo);
            setValor('');
        }
    };

    const sacar = () => {
        const valorNumerico = parseFloat(valor);
        if (!isNaN(valorNumerico) && valorNumerico > 0) {
            const taxa = saldo * 0.025;
            const novoSaldo = saldo - valorNumerico - taxa;
            if (novoSaldo >= 0) {
                setSaldo(novoSaldo);
                setValor('');
            } else {
                alert('Saldo insuficiente.');
            }
        }
    };
    return (
        <View style={styles.container}>
            <Image source={require('./Imagens/banco.png')} style={styles.Image} />
            <View style={styles.saldoContainer}>
                <Text style={styles.label}>Saldo Atual</Text>
                <Text style={styles.valor}>R$ {saldo.toFixed(2)}</Text>
            </View>
            <View>
                <TextInput
                    style={styles.input}
                    keyboardType="numeric"
                    placeholder="Digite o valor"
                    value={valor}
                    onChangeText={setValor}
                />
            </View>
            <View style={styles.formContainer}>
                <Pressable style={styles.button} onPress={() => openConfirmationModal('deposito')}>
                    <Text style={styles.buttonText}>Depositar</Text>
                </Pressable>
                <Pressable style={styles.button} onPress={() => openConfirmationModal('sacar')}>
                    <Text style={styles.buttonText}>Sacar</Text>
                </Pressable>
            </View>

           
            <Modal
                transparent={true}
                visible={showModal}
                onRequestClose={() => setShowModal(false)}
            >
                <View style={styles.modalContainer}>
                    <View style={styles.modalContent}>
                        <Text style={styles.modalMessage}>{modalMessage}</Text>
                        <Pressable style={styles.modalButton} onPress={handleConfirm}>
                            <Text style={styles.modalButtonText}>Confirmar</Text>
                        </Pressable>
                        <Pressable style={styles.modalButton} onPress={() => setShowModal(false)}>
                            <Text style={styles.modalButtonText}>Cancelar</Text>
                        </Pressable>
                    </View>
                </View>
            </Modal>
        </View>
    );
};

const styles = StyleSheet.create({
    container: {
        backgroundColor:'white',
        height:'100%',
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
        gap: 20,
        
    },
    label: {
        alignItems: 'center',
        fontSize: 30,
    },
    valor: {
    marginLeft:40
    },
    formContainer: {
        flexDirection: 'row',
    },
    input: {
        width:300,
        backgroundColor: 'red',
        borderRadius: 5, 
        padding:3,
        textAlign:'center'
    },
    button: {
        width:150,
        height:70,
        display: 1,
        backgroundColor: 'red',
        borderRadius: 5,
        paddingVertical: 10,
        paddingHorizontal: 20,
        alignItems: 'center',
        justifyContent: 'center',
        margin: 10,
        elevation: 3,
        marginTop: 100
    },
    buttonText: {
        fontSize:30,
        Textalign: 'center',
    },
    Image: {
        margin:20,
        backgroundColor:'white',
        borderRadius:10,
        display: 1,
        Textalign: "center",
        width: 300
    },
    modalContainer: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#000005',
    },
    modalContent: {
        width: 300,
        backgroundColor: 'white',
        borderRadius: 10,
        padding: 20,
        alignItems: 'center',
    },
    modalMessage: {
        fontSize: 18,
        marginBottom: 20,
    },
    modalButton: {
        backgroundColor: 'red',
        borderRadius: 5,
        padding: 10,
        margin: 5,
        width: '100%',
        alignItems: 'center',
    },
    modalButtonText: {
        color: 'black',
        fontSize: 16,
    },
});

export default Santoandre;